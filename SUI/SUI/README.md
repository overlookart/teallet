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

您也可以使用带有填充形状的trim()，尽管动画时结果有些奇怪。


## 视图布局(View layout)
在网格结构中定位视图等

### 如何使用VStack和HStack创建堆栈
我们的SwiftUI内容视图必须返回一个视图，即我们希望它们显示的视图。 当我们一次想要在屏幕上显示多个视图时，我们需要告诉SwiftUI如何安排它们，这就是堆栈进入的地方。
堆栈-等同于UIKit中的UIStackView-分为三种形式：水平（HStack），垂直（VStack）和基于深度（ZStack），当您要放置子视图以使其重叠时使用后者。

让我们从简单的事情开始。 这是一个文本视图：
```
Text("SwiftUI")
```
如果我们想在下面放置另一个，我们不能只写这个：
```
Text("SwiftUI")
    Text("rocks")
```


请记住，我们需要精确地返回一个视图，这样代码才能起作用。
相反，我们需要将其放置在垂直堆栈中，以使我们的文本视图彼此重叠：
```
VStack {
    Text("SwiftUI")
    Text("rocks")
}
```

您会注意到，垂直堆栈位于屏幕的中心，标签也居中，并且标签之间也有一些自动间隔。
如果您希望水平并排放置标签，则将VStack替换为HStack，如下所示：
```
HStack {
    Text("SwiftUI")
    Text("rocks")
}
```

### 如何使用对齐和间距自定义Stacks布局

您可以通过在初始化程序中提供一个值来在SwiftUI stack 内添加间距，如下所示：
```
VStack(spacing: 50) {
    Text("SwiftUI")
    Text("rocks")
}
```

另外，您可以在项目之间创建分隔线，以便SwiftUI在stack中的每个项目之间进行较小的视觉区分，如下所示：
```
VStack {
    Text("SwiftUI")
    Divider()
    Text("rocks")
}
```

默认情况下，Stack中的项目在中心对齐。 对于HStack，这意味着项目在中间垂直对齐，因此，如果您有两个不同高度的文本视图，则它们都将与其垂直中心对齐。 对于VStack，这意味着项目在中间水平对齐，因此，如果您有两个不同长度的文本视图，则它们都将与其水平中心对齐。
要对此进行调整，请在创建堆栈时传递对齐方式，如下所示：

```
VStack(alignment: .leading) {
    Text("SwiftUI")
    Text("rocks")
}
```

这样会将“ SwiftUI”和“rocks”都对齐到其左边缘，但是它们最终仍将位于屏幕中间，因为堆栈仅占用所需的空间。
当然，您可以同时使用对齐和间距，如下所示：

```
VStack(alignment: .leading, spacing: 20) {
    Text("SwiftUI")
    Text("rocks")
}
```
这样会将两个文本视图水平对齐到前缘（左到右语言是左对齐），并在它们之间放置20个垂直点。

### 如何使用填充控制单个视图周围的间距

SwiftUI允许我们使用padding（）修饰符在视图周围设置单独的填充。 如果不使用此参数，则所有方面都会得到系统默认的填充，如下所示：

```
VStack {
    Text("SwiftUI")
        .padding()
    Text("rocks")
}
```
但是您也可以自定义要应用的填充量和位置。 因此，您可能只想将系统填充应用于一侧：

```
Text("SwiftUI")
    .padding(.bottom)
```

或者，您可能希望控制对所有边应用多少填充：

```
Text("SwiftUI")
    .padding(100)
```

或者，您可以将两者结合起来，在视图的一侧添加特定数量的填充：

```
Text("SwiftUI")
    .padding(.bottom, 100)
```

### 如何使用Spacer将视图强制移到堆栈中的一侧

SwiftUI默认情况下将其视图居中，这意味着如果在VStack中放置三个文本视图，则这三个视图将垂直位于屏幕中央。 如果要更改此设置（如果要强制视图朝屏幕的顶部，底部，左侧或右侧），则应使用“Spacer”视图。
例如，这将一个文本视图放置在VStack内，这意味着它将垂直居中：

```
VStack {
            Text("Hello Swift")
        }
```

要将文本视图推到父视图的顶部，我们需要在其下方放置一个Spacer()，如下所示：

```
VStack {
    Text("Hello World")
    Spacer()
}
```

如果您希望在HStack的前端和后端有两段文字，可以使用这样的Spacer()：

```
HStack {
    Text("Hello")
    Spacer()
    Text("World")
}
```

Spacer会自动分割所有剩余空间，这意味着如果您使用多个Spacer，则可以按不同数量分割空间。
例如，这将通过在其上放置一个空格，在其后放置两个空格，将文本视图置于其父视图的三分之一以下：

```
VStack {
    Spacer()
    Text("Hello World")
    Spacer()
    Spacer()
}

```

### 如何制作固定尺寸的Spacer
SwiftUI的“Spacer”视图会自动填充其扩展轴上的所有可用空间，这是一种奇特的说法，即根据您所放置的内容，它们在水平或垂直方向上会占用尽可能多的空间。
如果要制作一个精确大小的垫片，则可以执行与其他视图相同的操作：使用具有所需大小的frame()修饰符。
例如，这显示了两个文本视图，它们之间有一个50点的空格：

```
VStack {
    Text("First Label")
    Spacer()
        .frame(height: 50)
    Text("Second Label")
}
```

如果为Spacer提供一定范围的值，例如使用.frame（minHeight：50，maxHeight：500），则它将自动占用尽可能多的空间，直到您设置的最大值。 以这种方式添加一些灵活性通常是一个好主意，这样您的用户界面就可以更轻松地跨设备扩展。

### 如何使用ZStack将视图彼此叠加

SwiftUI具有用于创建重叠内容的专用堆栈类型，例如，如果您想在图片上放置一些文本，则很有用。 它称为ZStack，其工作方式与其他两种堆栈类型相同。
例如，我们可以在一些文本下方放置一个大图像，如下所示：

```
ZStack {
    Image("example-image")
    Text("Hacking with Swift")
        .font(.largeTitle)
        .background(Color.black)
        .foregroundColor(.white)
}
```

像其他堆栈类型一样，ZStack可以通过对齐方式创建，这样它就不会始终将其内部居中：

```
ZStack(alignment: .leading) {
    Image("example-image")
    Text("Hacking with Swift")
        .font(.largeTitle)
        .background(Color.black)
        .foregroundColor(.white)
}
```

但是，它没有间距属性，因为它没有意义。 而是应使用offset（）修饰符，如如何使用其偏移量调整视图的位置中所示。

### 如何使用Z index 更改视图分层的顺序

默认情况下，ZStack使用绘画者的算法来确定视图的深度，以决定视图的深度：首先绘制您在ZStack中放置的所有内容，然后在其上分层放置后续视图。
尽管这通常是您想要的，但有时您需要更多的控制权-例如，您可能希望在应用运行时将一个视图推到另一个视图的后面，或者在点击某个视图时将其移到最前面。
为此，您需要使用zIndex()修饰符，该修饰符允许您确切指定视图在单个ZStack中的分层方式。 视图的默认Z索引为0，但是您可以提供正值或负值，分别将它们放置在其他视图的上方或下方。
例如，此ZStack包含两个重叠的矩形，但是绿色矩形仍然可见，因为它使用的Z索引值为1：

```
ZStack {
    Rectangle()
        .fill(Color.green)
        .frame(width: 50, height: 50)
        .zIndex(1)

    Rectangle()
        .fill(Color.red)
        .frame(width: 100, height: 100)
}
```

注意：zIndex()修饰符仅影响当前ZStack内的绘制顺序。 这意味着，如果您有两个重叠的堆栈，则需要考虑堆栈的Z索引以及堆栈内部的视图。

### 如何返回不同的视图类型

当我们从视图主体返回某个View时，Swift会理解为这意味着我们拥有一种特定的返回类型。 例如，如果我们想掷硬币并显示“您赢了！” 图片或一些文字表示“下次运气更好”，我们不能这样写：

```
var body: some View {
    if Bool.random() {
        Image("example-image")
    } else {
        Text("Better luck next time")
    }
}
```

这可能会返回图片或文本视图，这是不允许的-我们必须精确地返回一种类型。
有两种方法可以解决此问题。 第一种选择是将输出包装在一个Group中，这样，无论您发回图像还是文本视图，它们都将在一个Group中返回：

```
var body: some View {
    Group {
        if Bool.random() {
            Image("example-image")
        } else {
            Text("Better luck next time")
        }
    }
}
```

另外，SwiftUI为我们提供了一个可以返回的类型擦除包装器AnyView：

```
var body: some View {
    if Bool.random() {
        return AnyView(Image("example-image"))
    } else {
        return AnyView(Text("Better luck next time"))
    }
}
```

如果您还没有听说过这个概念，它会有效地迫使Swift忘记AnyView内的特定类型，让他们看起来像是同一个人。 不过，这会降低性能，因此请不要经常使用。
尽管Group和AnyView的布局效果均相同，但通常最好使用Group，因为SwiftUI效率更高。

### 如何使用ForEach循环创建视图

通常，您会发现要遍历序列以创建视图，而在SwiftUI中，这是使用ForEach完成的。
重要提示：很容易看到ForEach并认为它与Swift序列上的forEach()方法相同，但事实并非如此。
SwiftUI中的ForEach本身就是一个视图结构，这意味着您可以根据需要直接从视图主体中返回它。 您为它提供了一组项目，还可能需要告诉SwiftUI它如何唯一地标识每个项目，以便它知道在值更改时如何更新它们。 您还向它传递了一个闭包，以运行它来为循环中的每个项目创建一个视图。

对于范围的简单循环，您可以将范围直接传递到ForEach中，并告诉Swift将每个数字用作项目的唯一标识符。 例如，从10减少到1，然后在末尾添加一条消息：

```
VStack(alignment: .leading) {
    ForEach((1...10).reversed(), id: \.self) {
        Text("\($0)…")
    }

    Text("Ready or not, here I come!")
}
```

需要 .id(: \.self) 部分，以便SwiftUI可以唯一地标识数组中的每个元素–这意味着，如果添加或删除一项，SwiftUI会确切知道哪一个。

您可以使用这种方法来创建任何类型的循环。 例如，此代码创建一个由三种颜色组成的数组，将它们全部循环，并使用每种颜色名称和颜色值创建文本视图：

```
struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue]

    var body: some View {
        VStack {
            ForEach(colors, id: \.self) { color in
                Text(color.description.capitalized)
                    .padding()
                    .background(color)
            }
        }
    }
}
```

使用 \.self 告诉Swift，每个项目都使用其自己的值进行唯一标识。 因此，如果您具有数组[1、2、3]并通过 \.self 标识每个值，则意味着第一项具有标识符1，第二个具有标识符2，第三个具有标识符3。

如果数组中有自定义类型，则应使用id：类型内的任何属性对其进行唯一标识。 例如，这是一种存储测试结果的结构，如下所示：

```
struct Result {
    var id = UUID()
    var score: Int
}
```

该属性具有一个带有UUID的id属性，这意味着它保证是唯一的-对于我们的目的而言是完美的。 如果我们要遍历结果数组，创建一个文本视图以显示VStack中的每个结果，则可以使用以下方法：

```
struct ContentView: View {
    let results = [Result(score: 8), Result(score: 5), Result(score: 10)]

    var body: some View {
        VStack {
            ForEach(results, id: \.id) { result in
                Text("Result: \(result.score)")
            }
        }
    }
}
```

这告诉SwiftUI它可以通过查看它们的id属性来区分ForEach内部的视图。
或者，如果使Result符合可识别协议，则只需编写ForEach(results)。 遵守该协议意味着添加一个id属性，该属性唯一地标识每个对象，在我们的情况下，我们已经拥有了它。 因此，此代码实现了相同的结果：

```
struct Result: Identifiable {
    var id = UUID()
    var score: Int
}

struct ContentView: View {
    let results = [Result(score: 8), Result(score: 5), Result(score: 10)]

    var body: some View {
        VStack {
            ForEach(results) { result in
                Text("Result: \(result.score)")
            }
        }
    }
}
```

### 如何使用UserInterfaceSizeClass创建不同的布局


SwiftUI通过将大小型暴露在环境中供我们阅读来原生支持大小型。 要使用它们，首先创建一个@Environment对象，该对象将存储其值，如下所示：

```
@Environment(\.horizontalSizeClass) var horizontalSizeClass
```

然后，您可以根据需要检查该属性的值，查找.compact或.regular尺寸类，如下所示：

```
if horizontalSizeClass == .compact {
    return Text("Compact")
} else {
    return Text("Regular")
}
```

将所有内容放在一起，您可以创建如下视图：

```
struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?

    var body: some View {
        if horizontalSizeClass == .compact {
            return Text("Compact")
        } else {
            return Text("Regular")
        }
    }
}
```

大小类是通过将VStack或HStack用于内容来使用户界面智能地适应可用空间的好方法。 例如，如果您有很多空间，则可以水平放置东西，但在空间有限时切换到垂直布局。

### 如何根据UserInterfaceSizeClass在HStack和VStack之间自动切换

SwiftUI使我们可以监视当前的大小类，以决定事物的布局方式，例如从空间充足时的HStack切换到空间受限时的VStack。
稍加思考，我们就可以编写一个新的AdaptiveStack视图，该视图为我们自动在水平和垂直布局之间切换。 这使在iPad上创建出色的布局变得更加简单，因为我们的布局将自动调整以适应拆分视图和过渡方案。  
外观如下：

```
struct AdaptiveStack<Content: View>: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    let horizontalAlignment: HorizontalAlignment
    let verticalAlignment: VerticalAlignment
    let spacing: CGFloat?
    let content: () -> Content

    init(horizontalAlignment: HorizontalAlignment = .center, verticalAlignment: VerticalAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: @escaping () -> Content) {
        self.horizontalAlignment = horizontalAlignment
        self.verticalAlignment = verticalAlignment
        self.spacing = spacing
        self.content = content
}

    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack(alignment: horizontalAlignment, spacing: spacing, content: content)
            } else {
                HStack(alignment: verticalAlignment, spacing: spacing, content: content)
            }
        }
    }
}
```

有了这个，我们现在可以编写这样的布局：

```
struct ContentView: View {
    var body: some View {
        AdaptiveStack {
            Text("Horizontal when there's lots of space")
            Text("but")
            Text("Vertical when space is restricted")
        }
    }
}
```

要进行尝试，只需在iPad模拟器中运行该应用程序，然后尝试使用不同大小的拆分视图-您会看到ContentView在空间不足时会自动切换到VStack。

现在解释自定义视图的工作原理：

它监视horizo​​ntalSizeClass环境键，以便每次尺寸类更改时都会对其进行更新。
我们为它提供了分别存储水平和垂直对齐方式的参数，因此您可以精确控制布局的调整方式。
有一个可选的CGFloat用于间距，因为这正是VStack和HStack所使用的。如果需要更多控制，可以添加horizo​​ntalSpacing和verticalSpacing属性。
content属性是一个不接受任何参数并返回某种内容的函数，最终用户将依靠该视图构建器来创建其布局。
我们的初始化程序将它们全部藏起来以备后用。
在body属性内，我们可以读取水平尺寸类，然后在VStack或HStack中包装对content（）的调用。
就是这样！实际的代码非常简单，但是它为我们提供了一些非常有用的灵活性。

### 如何给视图自定义frame

默认情况下，视图仅占用所需的空间，但是如果要更改视图，可以使用frame（）修饰符告诉SwiftUI您想要的大小范围。
例如，您可以创建一个具有200x200可点击区域的按钮，如下所示：

```
Button(action: {
    print("Button tapped")
}) {
    Text("Welcome")
        .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
        .font(.largeTitle)
}
```

或者，您可以通过指定一个框架来使文本视图填充整个屏幕（减去安全区域），该框架的最小宽度和高度为零，最大宽度和高度为无穷大，如下所示：

```
Text("Please log in")
.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .font(.largeTitle)
    .foregroundColor(.white)
    .background(Color.red)
```

注意：如果要使视图进入安全区域，请确保添加.edgesIgnoringSafeArea（.all）修饰符。

### 如何使用GeometryReader提供相对大小

尽管通常最好让SwiftUI使用堆栈执行自动布局，但也可以使用GeometryReader提供相对于其容器的视图尺寸。 例如，如果您希望两个视图占用屏幕上可用宽度的一半，则无法使用hard-coded值，因为我们无法提前知道屏幕的宽度。
为了解决这个问题，GeometryReader为我们提供了一个输入值，告诉我们可用的宽度和高度，然后我们可以在需要的任何计算中使用它。 因此，要使两个视图占据相等的宽度，我们可以将可用空间分成两半，如下所示：

```
struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Text("Left")
                    .frame(width: geometry.size.width / 2, height: 50)
                    .background(Color.yellow)
                Text("Right")
                    .frame(width: geometry.size.width / 2, height: 50)
                    .background(Color.orange)
            }
        }
    }
}
```

注意：GeometryReader不考虑视图层次结构中更远的偏移量或间距，这就是为什么HStack上没有间距的原因–如果我们在其中允许间距，则视图对于可用空间会有点太大 。


### 如何将内容放置在安全区域之外

默认情况下，您的SwiftUI视图将大部分保留在安全区域内-会转到屏幕底部，但不会靠近设备顶部的任何凹口。
如果您要更改此设置–如果您希望视图真正全屏显示，即使这意味着部分被切口或其他硬件切口所遮盖，则应使用edgeIgnoringSafeArea()修饰符。

例如，这将创建一个红色文本视图，要求填充所有可用空间，然后将其设置为忽略任何安全区域，以使其真正边缘化。

```
Text("Hello World")
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color.red)
    .edgesIgnoringSafeArea(.all)
```

### 如何使用ScrollView添加水平和垂直滚动

SwiftUI的ScrollView使我们能够相对轻松地创建视图的滚动容器，因为它会自动调整自身大小以适合我们放置在其中的内容，并且还会自动添加额外的插图以避免出现安全区域。
例如，我们可以创建一个包含十个文本视图的滚动列表，如下所示：

```
ScrollView {
    VStack(spacing: 20) {
        ForEach(0..<10) {
            Text("Item \($0)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .frame(width: 200, height: 200)
                .background(Color.red)
        }
    }
}
```

滚动视图默认情况下是垂直的，但是您可以通过传入.horizontal作为第一个参数来控制轴。 因此，我们可以将前面的示例翻转为水平，如下所示：

```
ScrollView(.horizontal) {
    HStack(spacing: 20) {
        ForEach(0..<10) {
            Text("Item \($0)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .frame(width: 200, height: 200)
                .background(Color.red)
        }
    }
}
```

您可以使用[.horizontal，.vertical]同时指定两个轴。
最后，您可以决定是否在滚动动作发生时显示滚动指示器，如下所示：

```
ScrollView(.horizontal, showsIndicators: false) {
```

### 如何使用ScrollView和GeometryReader创建3D效果(如Cover Flow)

如果我们将GeometryReader与任何可以改变位置的视图(例如具有拖动手势或位于List内的视图)结合使用，则可以非常轻松地创建3D效果。 GeometryReader允许我们读取视图的坐标，并将这些值直接馈入rotation3DEffect()修饰符。

例如，我们可以通过在滚动视图中水平堆叠许多文本视图，然后应用rotation3DEffect（）来创建Cover Flow样式的滚动效果，这样当它们在滚动视图中移动时，它们会缓慢旋转，如下所示：

```
struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(1..<10) { num in
                    VStack {
                        GeometryReader { geo in
                            Text("Number \(num)")
                                .font(.largeTitle)
                            .padding()
                            .background(Color.red)
                            .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0))
                        }
                    }
                    .frame(width: 180)
                }
            }
            .padding()
        }
    }
}
```

我们可以使用DragGesture()进行类似的操作–此代码创建了一个可以在X和Y轴上拖动的类似于卡片的矩形，并使用了两个rotation3DEffect()修饰符来应用GeometryReader中的值：

```
struct ContentView: View {
    @State var dragAmount = CGSize.zero

    var body: some View {
        VStack {
            GeometryReader { geo in
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .rotation3DEffect(.degrees(-Double(self.dragAmount.width) / 20), axis: (x: 0, y: 1, z: 0))
                    .rotation3DEffect(.degrees(Double(self.dragAmount.height / 20)), axis: (x: 1, y: 0, z: 0))
                    .offset(self.dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { self.dragAmount = $0.translation }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    self.dragAmount = .zero
                                }
                            }
                    )
            }
        }
    }
}
```

拖动卡片时，会看到它旋转以产生透视效果。


### 如何在网格中放置视图

SwiftUI为我们提供了用于垂直布局的VStack和用于水平布局的HStack，但没有做到这两者–没有可以在网格结构中布局视图的东西。

幸运的是，我们可以利用SwiftUI的视图生成器系统来编写自己的代码。 这意味着编写必须使用行和列计数创建的类型，以及可以运行的闭包以检索网格中给定单元格的视图。 然后，可以在主体内部遍历所有行和列，并在VStack和HStack内部创建单元格以形成网格，每次调用视图关闭以询问单元格中应该包含什么。
在代码中，它看起来像这样：

```
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}
```

当您想在SwiftUI视图中使用它时，可以这样写：

```
GridStack(rows: 4, columns: 4) { row, col in
    Image(systemName: "\(row * 4 + col).circle")
    Text("R\(row) C\(col)")
}
```

这将创建一个4x4网格，每个单元格中均包含图像和文本。


## 响应事件(Responding to events)
响应交互并控制程序状态

### 程序状态

所有应用程序都会更改状态。例如，用户可能点击了一个按钮以显示更多信息，他们可能已经在文本框中输入了一些文本，或者从日期选择器中选择了一个日期-涉及应用程序从一种状态转移到另一种状态的所有内容。

状态的问题在于它太乱了：更改时，我们需要发现更改并更新布局以匹配。乍一看听起来很简单，但是随着我们状态的增长和发展，它变得越来越难–很容易忘记更新一件事情，或者弄错了更新顺序，从而使用户界面状态与预期的不符。

SwiftUI通过从控件中删除状态来解决此问题。当我们将属性添加到视图时，它们实际上是惰性的-当然，它们具有值，但是更改它们不会执行任何操作。但是，如果在它们之前添加了特殊的@State属性，SwiftUI将自动监视更改并更新使用该状态的视图的任何部分。

当涉及到某种状态时（例如，告诉状态属性在切换开关更改时更改），我们不能直接引用该属性。这是因为Swift认为我们现在指的是价值，而不是说“请注意这一点”。幸运的是，SwiftUI的解决方案是在属性名称前放置一个美元符号，这使我们可以引用数据本身而不是其当前值。我知道一开始这有点令人困惑，但是在一两个小时后，它就变成了第二天性。

请记住，SwiftUI是声明性的，这意味着我们预先将所有可能状态的所有布局都告诉了它，并让它弄清楚了当属性更改时如何在它们之间移动。我们称之为绑定–要求SwiftUI在UI控件和基础属性之间同步更改。

如果您习惯了更强制性的编程风格，那么与状态合作将首先使您感到头疼，但是请相信我-一旦您了解了它，一切都会一帆风顺。

### 如何创建切换开关

SwiftUI的切换功能使用户可以在真假状态之间切换，就像UIKit中的UISwitch一样。
例如，我们可以创建一个切换器，该切换器是否显示消息取决于切换器是否已启用，但是我们当然不需要手动跟踪切换器的状态–我们希望SwiftUI做 对我们来说。
相反，我们应该定义一个@State布尔属性，该属性将用于存储切换的当前值。 然后，我们可以根据需要使用它来显示或隐藏其他视图。
例如：

```
struct ContentView: View {
    @State private var showGreeting = true

    var body: some View {
        VStack {
            Toggle(isOn: $showGreeting) {
                Text("Show welcome message")
            }.padding()

            if showGreeting {
                Text("Hello World!")
            }
        }
    }
}
```

我已经编写了该代码，以便仅当showGreeting为true时才返回文本视图，这意味着当showGreeting为false时VStack的大小将减小–堆栈中没有第二个视图。

注意：使用@State时，Apple建议您使用private访问控制修饰符标记您的媒体资源，以明确表明该状态属于本地视图，而不在其他地方使用。

### 如何创建可点击的按钮

SwiftUI的按钮与UIButton相似，不同之处在于它在显示内容方面更加灵活，并且它对操作使用闭包，而不是旧的目标/操作系统。
要创建一个按钮，您将从以下代码开始：

```
Button(action: {
    // your action here
}) {
    Text("Button title")
}
```

例如，您可以制作一个按钮，在点击该按钮时显示或隐藏一些详细信息：

```
struct ContentView: View {
    @State private var showDetails = false

    var body: some View {
        VStack {
            Button(action: {
                self.showDetails.toggle()
            }) {
                Text("Show details")
            }

            if showDetails {
                Text("You should follow me on Twitter: @twostraws")
                    .font(.largeTitle)
            }
        }
    }
}
```

提示：在学习框架时，经典的做法是分散print()调用，以便您查看何时发生。 如果要通过按钮操作进行尝试，则应首先右键单击预览画布中的“播放”按钮，然后选择“调试预览”，以便您的print()调用起作用。
按钮内的标题可以是任何视图，因此您可以创建一个图像按钮，如下所示：

```
Button(action: {
    self.showDetails.toggle()
}) {
    Image("example-image")
}
```

### 如何禁用Button和NavigationLink中图像的叠加颜色

默认情况下，在NavigationLink或Button内部绘制的图像几乎不会表现出预期的效果：整个图像将被不透明的蓝色或视图中带有任何强调色的颜色覆盖。
有两种方法可以解决此问题； 选择哪种取决于您想要的行为。
首先，可以将buttonStyle()修饰符与PlainButtonStyle()一起使用，如下所示：

```
NavigationView {
    NavigationLink(destination: Text("Detail view here")) {
        Image("YourImage")
    }
    .buttonStyle(PlainButtonStyle())
}
```

或像这样的普通按钮：

```
Button(action: {
    // your action here
}) {
    Image("YourImage")
}
.buttonStyle(PlainButtonStyle())
```

使用该修改器后，您的原始图像将按预期显示。
或者，您也可以使用renderingMode()模式修饰符来获得略有不同的结果：

```
NavigationView {
    NavigationLink(destination: Text("Detail view here")) {
        Image("YourImage")
            .renderingMode(.original)
    }
}
```

区别是微妙的，但很重要：如果在列表中使用Button，则使用.buttonStyle(PlainButtonStyle())意味着只能轻按按钮内容周围的空格，而如果使用.renderingMode(.original)，则整个单元格仍可轻敲。

### 如何从TextField读取文本

SwiftUI的TextField视图类似于UITextField，尽管默认情况下看起来有点不同，并且在很大程度上依赖于绑定到状态。
要创建一个，您应该传递一个占位符以在文本字段内使用，外加它应该绑定到的状态值。 例如，这将创建一个绑定到本地字符串的TextField，然后在其下方放置一个文本视图，以显示您键入时文本字段的输出：

```
struct ContentView: View {
    @State private var name: String = "Tim"
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
            Text("Hello, \(name)!")
        }
    }
}
```

运行该命令后，您应该可以在文本字段中输入文字，并在下面直接看到问候语。
使用文本字段时，有两个重要的条件。 首先，默认情况下，它们没有边框，因此您可能看不到任何东西–您需要大致在其内部轻按以激活键盘。
其次，您可能会发现无法输入布局的画布预览。 如果遇到此问题，请按Cmd + R在模拟器中生成并运行代码。

### 如何在TextField上添加边框

SwiftUI的TextField视图默认没有样式，这意味着它在屏幕上是一个空白区域。 如果这符合您想要的样式，那就太好了-您已完成。 但是我们很多人都希望在文本字段周围添加边框以使其更清晰。
如果要获取UITextField常用的“四舍五入”文本字段样式，则应使用.textFieldStyle(RoundedBorderTextFieldStyle())修饰符，如下所示：

```
TextField("Enter some text", text: $yourBindingHere)
    .textFieldStyle(RoundedBorderTextFieldStyle())
```

### 如何将占位符添加到TextField

SwiftUI的TextField就像UITextField一样支持占位符文本-灰色文本，空白时显示在文本字段中，或者使用提示（“输入密码”）或显示一些示例数据。
要设置占位符，请将其作为文本字段的初始化程序的一部分传入，如下所示：

```
struct ContentView: View {
    @State private var emailAddress = ""

    var body: some View {
        TextField("johnnyappleseed@apple.com", text: $emailAddress)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
```

当该字段为空时，它将在文本字段中显示“ johnnyappleseed@apple.com”，但是一旦用户在其中输入内容，该字段就会消失。

### 如何在TextField中禁用自动更正

默认情况下，SwiftUI的TextField启用自动更正功能，这在大多数情况下都是您所需要的。 但是，如果要禁用它，可以使用disableAutocorrection()修饰符来实现，如下所示：

```
TextField("Enter your name", text: $name)
    .disableAutocorrection(true)
```

提示：如果您使用Xcode的视觉界面设计SwiftUI视图，则禁用自动更正的图标是带有一行的鸭子。 我会让你自己找出原因...

### 如何关闭TextField的键盘

SwiftUI的TextField会在激活后自动显示键盘，但完成后隐藏键盘是很棘手的-特别是如果您在将keyboardType（）修饰符与.numberPad，.decimalPad或.phonePad等一起使用时，尤其如此。

我将向您展示如何在短时间内随时隐藏键盘，但是首先我想说明一件事：SwiftUI没有内置的方式可以做到这一点–我们没有简单的修饰符 附加，所以如果您要解决这个问题，那不是因为您没有尽力而为。
要强制SwiftUI隐藏键盘，您需要使用以下代码：

```
UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
```

是的，这很长，但是它要求UIKit搜索所谓的响应者链（当前正在响应用户输入的控件集合），并找到能够退出其第一响应者状态的控件。 这是一种花哨的说法，“问任何有控制权的人停止使用键盘”，在我们的情况下，这意味着当文本字段处于活动状态时，键盘将被关闭。
由于该代码不是特别容易阅读，因此您应考虑将其包装在如下扩展名中：

```
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
```

现在，您可以从任何SwiftUI视图中编写self.hideKeyboard()。
使用方式取决于您的代码，但是下面是一个简单的示例，其中显示了一个十进制填充文本字段，并带有一个用于将其关闭的按钮：

```
struct ContentView: View {
    @State private var tipAmount = ""

    var body: some View {
        VStack {
            TextField("Name: ", text: $tipAmount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)

            Button("Submit") {
                print("Tip: \(self.tipAmount)")
                self.hideKeyboard()
            }
        }
    }
}
```

### 如何使用SecureField创建安全的文本字段

SwiftUI的SecureField的工作原理与常规TextField几乎相同，不同之处在于，出于保护隐私的目的而屏蔽了这些字符。 当然，将其绑定到的基础值仍然是纯字符串，因此您可以根据需要进行检查。
这是一个示例，该示例创建绑定到本地@State属性的SecureField，以便我们可以显示它们的键入内容：

```
struct ContentView: View {
    @State private var password: String = ""

    var body: some View {
        VStack {
            SecureField("Enter a password", text: $password)
            Text("You entered: \(password)")
        }
    }
}
```

### 如何创建滑块并从中读取值

SwiftUI的Slider视图的工作原理与UISlider相似，尽管您需要将其绑定到某个地方以便存储其值。

创建它时，可以提供多种参数，但是您可能最关心的是：
值：将其绑定到的Double值。
在：滑块的范围。
步骤：移动滑块时要更改多少值。
例如，以下代码创建绑定到Celsius属性的滑块，然后随着滑块的移动更新文本视图，以便在Celsius和Fahrenheit之间转换：

```
struct ContentView: View {
    @State private var celsius: Double = 0

    var body: some View {
        VStack {
            Slider(value: $celsius, in: -100...100, step: 0.1)
            Text("\(celsius) Celsius is \(celsius * 9 / 5 + 32) Fahrenheit")
        }
    }
}
```

### 如何创建选择器并从中读取值

SwiftUI的Picker视图设法将UIPicker和UITableView合并为一个，同时还可以适应其他操作系统上的其他样式。 很棒的是，我们真的不需要关心它的工作原理– SwiftUI在自动适应环境方面做得很好。

与大多数其他控件一样，您必须将选择器附加到某种状态，以跟踪选择器的选择。 例如，这将创建一个colors数组和一个整数，该整数存储选择的颜色，然后将其与选择器和文本视图一起使用，以便您可以看到正在回读的值：

```
struct ContentView: View {
   var colors = ["Red", "Green", "Blue", "Tartan"]
   @State private var selectedColor = 0

   var body: some View {
      VStack {
         Picker(selection: $selectedColor, label: Text("Please choose a color")) {
            ForEach(0 ..< colors.count) {
               Text(self.colors[$0])
            }
         }
         Text("You selected: \(colors[selectedColor])")
      }
   }
}
```

### 如何创建日期选择器并从中读取值

SwiftUI的DatePicker视图类似于UIDatePicker，并具有用于控制其外观和工作方式的各种选项。 像所有存储值的控件一样，它确实需要绑定到应用程序中的某种状态。
例如，这将创建一个绑定到birthDate属性的日期选择器，允许用户选择现在之前的任何日期，然后显示设置的日期选择器的值：

```
struct ContentView: View {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    @State private var birthDate = Date()

    var body: some View {
        VStack {
            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                Text("Select a date")
            }

            Text("Date is \(birthDate, formatter: dateFormatter)")
        }
    }
}
```

您可以看到我将displayComponents设置为.date，但也可以使用.hourAndMinute来获取时间数据。
使用in：... Date()将日期范围指定为直到当前日期（包括当前日期）的任何日期，但之后不包含任何日期。 您可以使用in：Date（）...进行相反的操作（即，允许从现在开始的日期），但是如果您需要的话，也可以使用精确范围。

### 如何创建分段控件并从中读取值

SwiftUI的Picker也可以用于创建与UIKit中的UISegmentedControl等效的分段控件，尽管它需要绑定到某种状态，并且您必须确保为每个分段提供一个标记，以便可以对其进行识别。 段可以是文本或图片； 其他任何事情都会无声地失败。
例如，这将创建一个与favouriteColor状态属性一起使用的分段控件，并在下面添加一个文本视图，该文本视图显示所选的值：

```
struct ContentView: View {
    @State private var favoriteColor = 0

    var body: some View {
        VStack {
            Picker(selection: $favoriteColor, label: Text("What is your favorite color?")) {
                Text("Red").tag(0)
                Text("Green").tag(1)
                Text("Blue").tag(2)
            }.pickerStyle(SegmentedPickerStyle())

            Text("Value: \(favoriteColor)")
        }
    }
}
```

不过，在这种情况下，最好创建一个数组来存储各种颜色，然后使用ForEach通过循环在内部创建文本视图：

```
struct ContentView: View {
    @State private var favoriteColor = 0
    var colors = ["Red", "Green", "Blue"]

    var body: some View {
        VStack {
            Picker(selection: $favoriteColor, label: Text("What is your favorite color?")) {
                ForEach(0..<colors.count) { index in
                    Text(self.colors[index]).tag(index)
                }
            }.pickerStyle(SegmentedPickerStyle())

            Text("Value: \(colors[favoriteColor])")
        }
    }
}
```

### 如何创建步进器并从中读取值

SwiftUI的Stepper控件使用户可以从我们指定的范围中选择值，并提供与UIKit中的UIStepper相同的功能。
例如，这将创建一个绑定到age属性的步进器，使用户可以选择0到130之间（包括0和130）的值：

```
struct ContentView: View {
    @State private var age = 18

    var body: some View {
        VStack {
            Stepper("Enter your age", value: $age, in: 0...130)
            Text("Your age is \(age)")
        }
    }
}
```

除了直接绑定到值外，还可以提供自定义onIncrement和onDecrement闭包来执行自定义工作，如下所示：

```
struct ContentView: View {
    @State private var age = 18

    var body: some View {
        VStack {
            Stepper("Enter your age", onIncrement: {
                self.age += 1
                print("Adding to age")
            }, onDecrement: {
                self.age -= 1
                print("Subtracting from age")
            })

            Text("Your age is \(age)")
        }
    }
}
```



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
