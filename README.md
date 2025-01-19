<div align="center">
  <h1 align="center" style="font-size: 50px;">🍃 Ind Utils 🍃</h1>
  <p align="center">A command-line tool that simplifies the task of creating files and creating assets images .</p>
</div>   

# ind_utils

ind_utils package use this package for Ind_utils package to simplify use for SizedBox, beautiful Log,
creating screens , styles , write assets images file
code.`

### Platform Support

| Android | iOS | macOS | Web | Linux | Windows |
|:-------:|:---:|:-----:|:---:|:-----:|:-------:|
|    ✅    |  ✅  |   ✅   |  ✅  |   ✅   |    ✅    |

## Installation

```yaml
dependencies:
  ind_utils: ^1.0.7
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
after it will be ask question like this 
Where your wanna create this file: example - lib/src/styles/
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
OR
PrintLogger.success(message);
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/assets/img_1.png)

```
printLog("Api URL:", url).link;//"🔗 Api URL : --> your url"
OR
PrintLogger.error(message);
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/assets/img_2.png)

```
printLog("Header :", header).header; //"📝 Header : --> your header"
OR
PrintLogger.warning(message);
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/assets/img_3.png)

```
printLog("Response Success: ", response).success; // "✅ Response Success: --> your response"
OR
PrintLogger.denied(message);
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/assets/img_4.png)

```
printLog("Request Data: ", request).info; // "ℹ️ Request Data:: --> your Request"
```

![Image Description](https://raw.githubusercontent.com/adobix/ind_utils/refs/heads/main/assets/img_5.png)

## Next Goals

- [x] We will Explore More Utils
