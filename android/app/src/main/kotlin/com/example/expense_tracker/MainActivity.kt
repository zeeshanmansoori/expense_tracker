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

import io.flutter.plugin.common.MethodChannel

import java.io.ByteArrayOutputStream

class MainActivity : FlutterActivity() {

    private var requestCodeNumber = 201119
    private val CHANNEL_NAME = "zeeshan_upi_app"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL_NAME
        ).setMethodCallHandler { call, result ->
            if (call.method.equals("getPaymentsApp")) {
                getInstalledUpiApps(result)
                return@setMethodCallHandler;
            }
            result.notImplemented()
        }
    }



//    private fun initiateTransaction(call: MethodCall) {
//        val app: String? = call.argument("app")
//        val pa: String? = call.argument("pa")
//        val pn: String? = call.argument("pn")
//        val mc: String? = call.argument("mc")
//        val tr: String? = call.argument("tr")
//        val tn: String? = call.argument("tn")
//        val am: String? = call.argument("am")
//        val cu: String? = call.argument("cu")
//        val url: String? = call.argument("url")
//
//        try {
//            /*
//             * Some UPI apps extract incorrect format VPA due to url encoding of `pa` parameter.
//             * For example, the VPA 'abc@upi' gets url encoded as 'abc%40upi' and is extracted as
//             * 'abc 40upi' by these apps. The URI building logic is changed to avoid URL encoding
//             * of the value of 'pa' parameter. - Reetesh
//            */
//            var uriStr: String? = "upi://pay?pa=" + pa +
//                    "&pn=" + Uri.encode(pn) +
//                    "&tr=" + Uri.encode(tr) +
//                    "&am=" + Uri.encode(am) +
//                    "&cu=" + Uri.encode(cu)
//            if (url != null) {
//                uriStr += ("&url=" + Uri.encode(url))
//            }
//            if (mc != null) {
//                uriStr += ("&mc=" + Uri.encode(mc))
//            }
//            if (tn != null) {
//                uriStr += ("&tn=" + Uri.encode(tn))
//            }
//            uriStr += "&mode=00" // &orgid=000000"
//            val uri = Uri.parse(uriStr)
//            // Log.d("upi_pay", "initiateTransaction URI: " + uri.toString())
//
//            val intent = Intent(Intent.ACTION_VIEW, uri)
//            intent.setPackage(app)
//
//            if (intent.resolveActivity(activity.packageManager) == null) {
//                this.success("activity_unavailable")
//                return
//            }
//
//            activity.startActivityForResult(intent, requestCodeNumber)
//        } catch (ex: Exception) {
//            Log.e("upi_pay", ex.toString())
//            this.success("failed_to_open_app")
//        }
//    }


    private fun getInstalledUpiApps(result: MethodChannel.Result) {

        val uriBuilder = Uri.Builder()
        uriBuilder.scheme("upi").authority("pay")

        val uri = uriBuilder.build()
        val intent = Intent(Intent.ACTION_VIEW, uri)

        val packageManager = activity.packageManager

        try {
            val activities =
                packageManager.queryIntentActivities(intent, PackageManager.MATCH_DEFAULT_ONLY)
            Log.d("upi_pay", "getInstalledUpiApps: $activities")
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
            Log.e("upi_pay", ex.toString())
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

//    private fun success(o: String) {
//        if (!hasResponded) {
//            hasResponded = true
//            result?.success(o)
//        }
//    }
//
//
//    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
//        super.onActivityResult(requestCode, resultCode, data)
//
//        if (requestCodeNumber == requestCode && result != null) {
//            if (data != null) {
//                try {
//                    val response = data.getStringExtra("response")!!
//                    this.success(response)
//                } catch (ex: Exception) {
//                    this.success("invalid_response")
//                }
//            } else {
//                this.success("user_cancelled")
//            }
//        }
//        return true
//    }

}



