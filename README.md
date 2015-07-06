# How to use infer with iOS project (objective-c)

Infer can analyze apps built using xcodebuild. Only .m and .c files will be analyzed; .cpp, .cc and .mm files will be ignored.

```
infer -- xcodebuild -target testapp-c -configuration Debug -sdk iphonesimulator
```

