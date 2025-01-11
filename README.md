# ind_utils

ind_utils package use this package for Generate Assets file `

## Installation

```yaml
dependencies:
  ind_utils: ^1.0.3
```
## Run the generator
- when u will run this cmd you will get
- Here Below 👇👇👇 - First Go that directory where you wanna Create Screen, Controller, Widget .
- To execute the following command:
```
dart pub run ind_utils:screen
```
```
     ├─ screen/
         └─ profile_screen.dart
     ├─ controller/
         └─ profile_controller.dart     
     ├─ repository/
         └─ profile_repository.dart       
         └─ profile_repository_interface.dart   
     ├─ widget
         
```

## Run the generator:
- Assets file and Put images in class
- Here 👇👇👇 - First Go that directory where you wanna create assets .
- To execute the following command: 
```
dart pub run ind_utils:assets
```
## Run the generator:
- Styling Code Like App color , EdgeInsets
- Here 👇👇👇 - First Go that directory where you wanna This.
- To execute the following command:
```
dart pub run ind_utils:style
```


## Print Type
Just use Like This: You can Print with different Icon just change end type :
```
printLog("Method :", "POST").method;// "⚙️ Method : Get";
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/assets/img_1.png)
```
printLog("Api URL:", url).link;//"🔗 Api URL : --> your url"
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/assets/img_2.png)
```
printLog("Header :", header).header; //"📝 Header : --> your header"
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/assets/img_3.png)
```
printLog("Response Success: ", response).success; // "✅ Response Success: --> your response"
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/assets/img_4.png)
```
printLog("Request Data: ", request).info; // "ℹ️ Request Data:: --> your Request"
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/assets/img_5.png)

## Next Goals

- [x] We will Explore More Utils
