# Dokumentasi LunaPOS Web App (Phase 2)

---

Dokumen ini akan menjelaskan kebutuhan apa saja yang perlu dilakukan untuk menggunakan Web App Lunapos ke dalam project Flutter.

Jika anda ingin men-download project demo yang kami buat, silakan buka link repository berikut: [https://github.com/bagassfn/luna-trial-web-app-example](https://github.com/bagassfn/luna-trial-web-app-example)

Dokumentasi ini dibuat berdasarkan demo project di atas.

## Host URL

---

Berikut ini ada host url yang digunakan untuk membuka web app LunaPOS:

```
https://dev-app-browser.lunapos.id/#/
```

## Query Params

| Nama Parameter     | Perilaku | Deskripsi                               |
| ------------------ | -------- | --------------------------------------- |
| user_first_name    | Wajib    | Nama Depan                              |
| user_last_name     | Wajib    | Nama Belakan                            |
| user_email         | Wajib    | Email User                              |
| user_mobile_number | Wajib    | Phone Number (tanpa angka ‘0’ di-depan) |

## Contoh Penggunaan

Dalam project contoh pada repository yang deberikan sebelumnya, saya menggunakan library `webview_flutter` untuk membuka Web App Lunapos. Silakan gunakan cara yang anda rasa lebih nyaman bila tidak ingin menggunakan library tersebut. Sebagai referensi silakan buka link berikut [https://pub.dev/packages/webview_flutter](https://pub.dev/packages/webview_flutter).

Contoh URL yang sudah di-isi dengan query params di atas akan terlihat seperti ini:

```
https://dev-app-browser.lunapos.id/#/?user_first_name=Bagas&user_last_name=Nasution&user_email=bagas@lunapos.com&user_mobile_number=08121213112
```

Jika anda menggunakan library `webview_flutter` (sebagai contoh) maka code akan terlihat seperti di bawah ini:

```dart
	WebViewController _webViewController() {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
          'https://dev-app-browser.lunapos.id/#/?user_first_name=Bagas&user_last_name=Nasution&user_email=bagas@lunapos.com&user_mobile_number=08121213112'
        ),
      );

    return controller;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Luna Trial'),
      ),
      body: WebViewWidget(controller: _webViewController()),
    );
  }
```