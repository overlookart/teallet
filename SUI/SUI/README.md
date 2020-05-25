#  SwiftUI 入门指南
[文献](https://www.hackingwithswift.com/quick-start/swiftui):https://www.hackingwithswift.com/quick-start/swiftui

## 基本的Single View App模板
* AppDelegate.swift。这负责监视外部事件，例如是否有其他应用尝试向您发送文件以打开  
* SceneDelegate.swift。这负责管理应用程序的显示方式，例如让多个实例同时运行或在一个实例移至后台时采取措施。
* ContentView.swift。这是我们最初的用户界面。如果这是一个UIKit项目，那么它将是Xcode提供给我们的ViewController类。
* Assets.xcassets。这是资产目录，其中存储了我们项目中使用的所有图像和颜色。
* LaunchScreen.storyboard。这是您的应用加载时显示的屏幕。
* Info.plist是一个属性列表文件，在这种情况下，该文件用于存储我们应用程序的系统级设置-例如，应在iOS主屏幕上图标的下方显示名称。

我们真正关心的部分-实际上，这是唯一重要的部分-ContentView.swift。这是我们应用程序的主要功能，在这里我们可以马上尝试各种SwiftUI代码。

是什么使ContentView.swift出现在屏幕上？
打开SceneDelegate.swift，您将在其中看到如下代码：

```
if let windowScene = scene as? UIWindowScene {
   let window = UIWindow(windowScene: windowScene)
   window.rootViewController = UIHostingController(rootView: contentView)
   self.window = window
   window.makeKeyAndVisible()
}
```

该代码将创建一个新的ContentView实例（这是我们不久将要看到的主要功能），并将其放置在窗口内，以便在屏幕上可见。 通过显示ContentView的第一个实例，它可以有效地引导我们的应用程序，然后将其交给我们-您想做什么？


打开ContentView.swift，让我们看一些实际的SwiftUI代码。 您应该看到如下代码：

```
import SwiftUI
struct ContentView: View {
    var body: some View {
        Text("Hello World")
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
```

首先，请注意ContentView如何是一个结构。其次，ContentView符合View协议。您想要在SwiftUI中显示的所有内容都需要符合View，实际上这仅意味着一件事：您需要拥有一个名为body的属性，该属性可以返回某种View。第三，主体的返回类型是some View。在Swift 5.1中引入了some关键字，它是称为不透明返回类型的功能的一部分，在这种情况下，其字面意思是“这将返回某种View，但是SwiftUI不需要知道（或关心）什么”。 ”第四，在body属性内有Text（“ Hello World”），它创建了文本“ Hello World”的标签。最后，在ContentView下面是一个类似但不同的结构，称为ContentView_Previews。这不符合View协议，因为它专门用于在Xcode中显示视图预览，而不是在实际应用中显示在屏幕上。这就是为什么您会在#if DEBUG和#endif行中看到它的原因-仅当我们的应用程序在调试环境中运行时，此代码才内置到最终产品中，因为在生产应用程序中没有意义。



重要说明：返回some View表示body属性将返回符合View协议的内容。您不能返回很多东西，也不会忘记返回任何东西– Swift编译器将拒绝构建您的代码。为了清楚起见，您的视图主体必须始终精确返回一个子视图。

## Text and Image  

### 如何使用Text创建静态Label
文本视图在屏幕上显示静态文本，等效于UIKit中的UILabel。 从最基本的角度来看，它们如下所示：  
```
Text("Hello World")
```

默认情况下，文本视图会根据需要自动换行，但是如果您希望限制它们可以使用的行数，则应添加lineLimit修饰符，如下所示：  
```
Text("Hello World").lineLimit(2)
```

如果您在某些文本上设置了行数限制，然后为其提供了一个长度太长而无法容纳在可用空间中的字符串，则SwiftUI将截断文本，使其以“ ...”结尾。您可以调整SwiftUI截断文本的方式：默认是从末尾删除文本并在其中显示省略号，但是您还可以根据字符串各部分的重要性将省略号放在中间或开头。

```
var body: some View {
    Text("This is an extremely long textbstring that will never fit even the widest of Phones")
        .lineLimit(1)
        .truncationMode(.middle)
}
```

无论您如何截断文本，您都将看到文本视图整齐地位于主视图的中心。 这是SwiftUI的默认行为-除非被告知将视图放置在其他位置，否则它将相对于屏幕中心进行放置。

### 如何使用字体，颜色，行距等为文本视图设置样式

文本视图不仅在外观上为我们提供了可预期的广泛控制，而且还旨在与Apple核心技术（例如Dynamic Type）无缝地协同工作。  
默认情况下，Text视图具有“body”动态类型样式，但是您可以通过在其上调用.font()来从其他大小和权重中进行选择，如下所示：

```
Text("This is an extremely long text string that will never fit even the widest of Phones")
    .font(.largeTitle)
```

调整其文本对齐方式，以使行居中，如下所示：

```
Text("This is an extremely long text string that will never fit even the widest of Phones")
    .font(.largeTitle)
    .multilineTextAlignment(.center)
```

我们可以使用.foregroundColor()修饰符控制文本的颜色，如下所示：

```
Text("The best laid plans").foregroundColor(Color.red)

```

背景颜色使用.background()，因为可以使用比纯色更高级的背景。 无论如何，要为我们的布局提供黄色背景色，我们可以添加以下内容：

```
Text("The best laid plans")
    .background(Color.yellow)
    .foregroundColor(Color.red)
```

调整文本中的行距。 默认值为0，表示没有应用额外的行距，但是您也可以指定位置值以在行之间添加额外的间距：

```
Text("This is an extremely long string that will never fit even the widest of Phones")
    .font(.largeTitle)
    .lineSpacing(50)
```

### 如何在文本视图中设置文本格式

SwiftUI的文本视图具有一个可选的formatter参数，该参数使我们可以自定义标签内数据的显示方式。 这很重要，因为当程序中发生某些事情时，值通常会为我们更新，因此通过附加格式化程序SwiftUI可以确保我们的数据代表我们正确。

例如，这定义了一个日期格式器，并使用它来确保任务日期以人类可读的形式显示：

```
struct ContentView: View {
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    var dueDate = Date()

    var body: some View {
        Text("Task due date: \(dueDate, formatter: Self.taskDateFormat)")
    }
}
```

### 如何在文字中的字母之间增加间距
SwiftUI为我们提供了两个修饰符，可控制文本视图内字符的间距，从而使我们可以根据您的需要使字母间距更紧密或更远。
这两个修饰符是tracking()和kerning()：两者都增加了字母之间的间距，但是tracking将拉开连字，而kerning不会，连字距将留下一些尾随空白，而tracking不会。

因此，这将为“ Hello World”增加20个跟踪点，这将使字母之间的间距相当大：  
```
Text("Hello World")
    .tracking(20)
```

如果您想真正了解字距调整和跟踪有何不同，请尝试以下操作：

```
VStack {
    Text("ffi")
        .font(.custom("AmericanTypewriter", size: 72))
        .kerning(50)
    Text("ffi")
        .font(.custom("AmericanTypewriter", size: 72))
        .tracking(50)
}
```

它使用American Typewriter中的文本字符串“ ffi”，它具有连字格式，使字母组合看起来更好。 由于跟踪将连字分开，字距调整也没有，因此第一个文本看起来像“ f fi”，第二个文本看起来像“ f f i”

### 如何使用Image视图绘制图像



## 视图布局(View layout)

## 响应事件(Responding to events)

## 进价状态(Advanced state)

## 列表(Lists)

## Forms

## Containers

## Alerts and action sheets

## Presenting views

## Transforming views

## Drawing

## Animation

## Composing views

## Cross-platform

## Core Data

## Accessibility

## Tooling

## What now?

## Appendix A

## Appendix B

## 
