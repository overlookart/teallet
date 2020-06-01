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

使用Image视图在SwiftUI布局中呈现图像。 这些可以从您的包，系统图标，UIImage等加载图像，但是这三个是最常见的。

要从包中加载图片并将其显示在图片视图中，只需使用以下方法：

```  
var body: some View {
    Image("example-image")
}
```

要从AppleApple’s San Francisco符号集加载图标，请使用Image（systemName :)初始化程序，并传入要加载的图标字符串，如下所示：

```  
Image(systemName: "cloud.heavyrain.fill")
```

最后，您可以从现有的UIImage创建图像视图。 由于这需要更多代码，因此您需要显式使用return关键字：
```
guard let img = UIImage(named: "example-image") else {
    fatalError("Unable to load image")
}

return Image(uiImage: img)
```
如果您使用的是系统图标集，则返回的图像是可缩放的和可着色的，这意味着您可以使用已经看到的相同的frontantColor（）修饰符为图像着色：

```
Image(systemName: "cloud.heavyrain.fill")
    .foregroundColor(.red)
```

而且这还意味着您可以要求SwiftUI放大图像以匹配其随附的任何“动态类型”文本样式（如果有）：
```
Image(systemName: "cloud.heavyrain.fill")
    .font(.largeTitle)
```

### 如何调整图像适合其空间的方式
SwiftUI的图片视图可以以不同的方式缩放，就像UIImageView的内容模式一样。

默认情况下，图像视图会自动调整其大小以适应其内容，这可能会使它们超出屏幕。 如果添加resizable（）修饰符，则图像将自动调整大小，以使其充满所有可用空间：
```
Image("example-image")
    .resizable()
```

但是，这也可能导致图像的原始宽高比失真，因为它将在所有尺寸上拉伸所需的任何量以使其填充空间。
如果要保持其宽高比，则应使用.fill或.fit添加一个AspectRatio修饰符，如下所示：
```
Image("example-image")
    .resizable()
    .aspectRatio(contentMode: .fit)
```

### 如何平铺图像
如果要求SwiftUI使图片视图占用比图片设计更多的空间，则默认行为是拉伸图片，使其适合您所需要的空间。 但是，并不需要那样做：它还可以平铺图像，即水平和垂直重复图像以完全填充空间。

关键是将resizable（）修饰符与其resizingMode参数一起使用。 该名称可以是.stretch（默认设置）或.tile，其中.tile是您要查找的内容。
在代码中，它看起来像这样：
```
Image("YourImage")
    .resizable(resizingMode: .tile)
```
如果您只想平铺图像的一部分（将一个或多个边缘固定在图像视图的边缘），则可以为第一个参数提供边缘插图，如下所示：
```
Image("YourImage")
    .resizable(capInsets: EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20), resizingMode: .tile)
```

### 如何渲染渐变
SwiftUI为我们提供了各种渐变选项，所有这些选项都可以以多种方式使用。 例如，您可以使用白色到黑色的线性渐变来渲染文本视图，如下所示：
```
Text("Hello World")
    .padding()
    .foregroundColor(.white)
    .background(LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom))
```

颜色被指定为一个数组，您可以根据需要设置任意多个颜色–默认情况下，SwiftUI会将它们平均隔开。 因此，我们可以像这样从白色变成红色再变成黑色：
```
Text("Hello World")
    .padding()
    .foregroundColor(.white)
    .background(LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .top, endPoint: .bottom))
```

要制作水平渐变而不是垂直渐变，请使用.lead和.trailing作为起点和终点：
```
Text("Hello World")
    .padding()
    .foregroundColor(.white)
    .background(LinearGradient(gradient: Gradient(colors: [.white, .red, .black]), startPoint: .leading, endPoint: .trailing))
```

对于其他渐变样式，请尝试RadialGradient或AngularGradient。 例如，这将创建一个从圆心开始到边缘的各种颜色的径向渐变：
```
let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple])
let conic = RadialGradient(gradient: colors, center: .center, startRadius: 50, endRadius: 200)
return Circle()
    .fill(conic)
    .frame(width: 400, height: 400)
```

这将创建一个角度渐变（通常称为圆锥渐变），循环显示各种颜色，然后返回到起点：
```
let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red])
let conic = AngularGradient(gradient: colors, center: .center)
return Circle()
    .fill(conic)
```

由于所有三种渐变类型都符合ShapeStyle协议，因此可以将它们用于背景，填充和笔触。 例如，这使用我们的彩虹圆锥形渐变作为圆的粗内部笔画：
```
let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red])
let conic = AngularGradient(gradient: colors, center: .center, startAngle: .zero, endAngle: .degrees(360))
return Circle()
    .strokeBorder(conic, lineWidth: 50)
```

### 如何使用图像和其他视图作为背景
您可以使用相同的background（）修饰符指定背景图像，而不是指定背景颜色。
例如，这将创建一个具有大字体的文本视图，然后在其后放置一个100x100的图像：
```
Text("Hacking with Swift")
    .font(.largeTitle)
    .background(
        Image("example-image")
            .resizable()
            .frame(width: 100, height: 100))
```

但是，在SwiftUI中，它不必是图像-您实际上可以为背景使用任何类型的视图。 例如，这将创建相同的文本视图，然后在其后放置一个200x200的红色圆圈：
```
Text("Hacking with Swift")
    .font(.largeTitle)
    .background(Circle()
        .fill(Color.red)
        .frame(width: 200, height: 200))
```

默认情况下，背景视图会自动占据需要完全可见的空间，但是如果您愿意，可以使用clipped（）修饰符将它们裁剪为其父视图的大小：
```
Text("Hacking with Swift")
    .font(.largeTitle)
    .background(Circle()
        .fill(Color.red)
        .frame(width: 200, height: 200))
        .clipped()
```

明确地说，您可以使用任何视图作为背景–例如，如果需要，可以使用另一个文本视图。

### 如何显示实体形状
如果您想在应用程序中使用简单的形状，则可以直接创建它们，然后根据需要对其进行着色和定位。
例如，如果您想要一个200x200的红色矩形，则可以使用以下代码：
```
Rectangle()
    .fill(Color.red)
    .frame(width: 200, height: 200)
```

同样，如果您想要一个50x50的蓝色圆圈，则可以使用以下方法：
```
Circle()
    .fill(Color.blue)
    .frame(width: 50, height: 50)
```

### 如何使用trim()绘制实体形状的一部分  
SwiftUI允许我们使用其trim（）修饰符仅绘制笔触的一部分或填充形状，该修饰符采用两个参数：起始值和终止值，均存储为0到1之间的CGFloat。
例如，如果您想要一个半圆，可以这样写：
```
Circle()
    .trim(from: 0, to: 0.5)
    .frame(width: 200, height: 200)
```

SwiftUI绘制其形状，使0度直接位于右侧，因此，如果要更改为使其直接向上0度，则应应用rotationEffect（）修饰符。
例如，它使用计时器来调整传递给trim（）的值，以使圆的笔触随时间增长，例如进度指示器：
```
struct ContentView: View {
    @State private var completionAmount: CGFloat = 0.0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Rectangle()
            .trim(from: 0, to: completionAmount)
            .stroke(Color.red, lineWidth: 20)
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(-90))
            .onReceive(timer) { _ in
                withAnimation {
                    guard self.completionAmount < 1 else { return }
                    self.completionAmount += 0.2
                }
            }
    }
}
```

您也可以使用带有填充形状的trim（），尽管动画时结果有些奇怪。


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
