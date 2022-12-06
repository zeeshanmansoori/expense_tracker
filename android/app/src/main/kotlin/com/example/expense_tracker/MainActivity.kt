package com.example.expense_tracker

import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.drawable.Drawable
import android.net.Uri
import android.util.Base64
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall

import io.flutter.plugin.common.MethodChannel

import java.io.ByteArrayOutputStream

class MainActivity : FlutterActivity() {

    companion object {

        private const val CHANNEL_NAME = "zeeshan_upi_app"
        private const val PAYMENT_REQUEST_CODE = 156
        private const val TAG = "MainActivity"

    }

    private var methodResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME
        ).setMethodCallHandler { call, result ->
            methodResult = result
            if (call.method.equals("getPaymentsApp")) {
                getInstalledUpiApps(result)
                return@setMethodCallHandler
            }

            if (call.method.equals("makePayment")) {
                initPayment(call)
                return@setMethodCallHandler
            }
            result.notImplemented()
        }
    }


    private fun initPayment(call: MethodCall) {
        val app: String? = call.argument("app")
        val qrCode: String? = call.argument("qrCode")

        try {


            // Set Data Intent
            val paymentIntent = Intent(Intent.ACTION_VIEW).apply {
                Log.d(TAG, "initPayment: $qrCode")
                data = Uri.parse(qrCode)
                `package` = app
            }

            if (paymentIntent.resolveActivity(packageManager) == null) {
                return
            }

            startActivityForResult(paymentIntent, PAYMENT_REQUEST_CODE)
        } catch (ex: Exception) {
            Log.e(TAG, "initPayment:", ex)
        }
    }


    private fun getInstalledUpiApps(result: MethodChannel.Result) {

        val uriBuilder = Uri.Builder()
        uriBuilder.scheme("upi").authority("pay")

        val uri = uriBuilder.build()
        val intent = Intent(Intent.ACTION_VIEW, uri)

        val packageManager = packageManager

        try {
            val activities =
                packageManager.queryIntentActivities(intent, PackageManager.MATCH_DEFAULT_ONLY)
            Log.d(TAG, "getInstalledUpiApps: $activities")
            // Convert the activities into a response that can be transferred over the channel.
            val activityResponse = activities.map {
                val packageName = it.activityInfo.packageName
                val drawable = packageManager.getApplicationIcon(packageName)

                val bitmap = getBitmapFromDrawable(drawable)
                val icon = encodeToBase64(bitmap)

                mapOf(
                    "packageName" to packageName,
                    "icon" to icon,
                    "priority" to it.priority,
                    "preferredOrder" to it.preferredOrder,
                    "appName" to it.loadLabel(packageManager).toString()
                )
            }

            result.success(activityResponse)
        } catch (ex: Exception) {
            Log.e(TAG, ex.toString())
            result.error("getInstalledUpiApps", "exception", ex)
        }
    }

    private fun encodeToBase64(image: Bitmap): String? {
        val byteArrayOS = ByteArrayOutputStream()
        image.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOS)
        return Base64.encodeToString(byteArrayOS.toByteArray(), Base64.NO_WRAP)
    }

    private fun getBitmapFromDrawable(drawable: Drawable): Bitmap {
        val bmp: Bitmap = Bitmap.createBitmap(
            drawable.intrinsicWidth,
            drawable.intrinsicHeight,
            Bitmap.Config.ARGB_8888
        )
        val canvas = Canvas(bmp)
        drawable.setBounds(0, 0, canvas.width, canvas.height)
        drawable.draw(canvas)
        return bmp
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == PAYMENT_REQUEST_CODE) {
            if (data == null) {
                Log.e(TAG, "Intent Data is null. User cancelled")
                callbackTransactionCancelled()
                return
            }

            val response = data.getStringExtra("response")

            if (response == null) {
                Log.d(TAG, "Payment Response is null")
                callbackTransactionCancelled()
                return
            }

            runCatching {
                val transaction = getMapFromQuery(response)
                Log.d(TAG, "onActivityResult: transaction $transaction")
//                        get("Status"),
//                        get("txnId"),
//                        get("responseCode"),
//                        get("ApprovalRefNo"),
//                        get("txnRef"),
                callbackTransactionCompleted(transaction)
            }.getOrElse {
                callbackTransactionCancelled()
            }


        }
    }

    internal fun getMapFromQuery(queryString: String): Map<String, String> {
        val map = mutableMapOf<String, String>()
        val keyValuePairs = queryString
            .split("&")
            .map { param ->
                param.split("=").let { Pair(it[0], it[1]) }
            }
        map.putAll(keyValuePairs)
        return map
    }

    internal fun callbackTransactionCancelled() {
        Log.d(TAG, "callbackTransactionCancelled: ")
        methodResult?.error("transaction", "transaction cancelled", null)
    }

    internal fun callbackTransactionCompleted(transaction: Map<String, String>) {
        methodResult?.success(transaction)
    }
}



