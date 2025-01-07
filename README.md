# ind_utils

ind_utils package use this package for Generate Assets file `

## Installation

```yaml
dependencies:
  ind_utils: ^1.0.2
```
## Run the generator
To execute the following command: - when u will run this cmd you will get
- Here Below 👇👇👇.
```
flutter pub run ind_utils:screen_gen profile_screen profile_controller
```
```
lib/
   ├─ src/
   │   └─ feature/
   │    ├─ screen/
   │    │  └─ profile_screen.dart
   │    ├─ controller/
   │    │  └─ profile_controller.dart       
```
OR-

```
flutter pub run ind_utils:screen_gen profile_screen
```
```
lib/
   ├─ src/
   │   └─ feature/
   │    ├─ screen/
   │    │  └─ profile_screen.dart
   │    ├─ controller/
   │    │  └─ profile_screen_controller.dart       
```

## Run the generator:
To execute the following command: -  Assets file and Put images in class
- Here 👇👇👇.
```
flutter pub run ind_utils:assets_gen
```

## Run the generator:
To execute the following command: -  Helper file and there define colors , api_url
- Here 👇👇👇.
```
flutter pub run ind_utils:helper_gen
```

## Print Type
Just use Like This: You can Print with different Icon just change end type :
```
printLog("Method :", "POST").method;// "⚙️ Method : Get";
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/img_1.png)
```
printLog("Api URL:", url).link;//"🔗 Api URL : --> your url"
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/img_2.png)
```
printLog("Header :", header).header; //"📝 Header : --> your header"
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/img_3.png)
```
printLog("Response Success: ", response).success; // "✅ Response Success: --> your response"
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/img_4.png)
```
printLog("Request Data: ", request).info; // "ℹ️ Request Data:: --> your Request"
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/img_5.png)

## Next Goals

- [x] We will Explore More Utils