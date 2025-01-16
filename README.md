
<div align="center">
  <h1 align="center" style="font-size: 50px;">🍃 Ind Utils 🍃</h1>
  <p align="center">
  A command-line tool that simplifies the task of updating your Flutter app's launcher icon. Full flexibility allows you to only update the launcher icon for specific platforms as needed.
 </p>
</div>   
   
# ind_utils

ind_utils package use this package for Generate Assets file `

## Installation

```yaml
dependencies:
  ind_utils: ^1.0.5
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
          └─ widget_name.dart
     ├─ model
         
```

## Run the generator:
- Assets file and Put images in class
- Here 👇👇👇
1. Make sure Stay in Project Directory
2. Go that directory where you wanna Create.

- To execute the following command: 
```
dart pub run ind_utils:assets
```
## Run the generator:
- Styling Code Like App color , EdgeInsets
- Here 👇👇👇 - First Go that directory where you wanna Create This.
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
