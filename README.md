# teallet

###### 文献地址：https://www.hackingwithswift.com/quick-start/swiftui

## 介绍
SwiftUI基础的简要说明

### 关于SwiftUI的常见问题

很多人已经在问我关于SwiftUI的问题，我已经尽力请其他认识更多的人来尝试找到合适的答案。
所以，这里...
学习哪个：SwiftUI或UIKit？
这个问题被问了很多遍了，我在本书中添加了专门的章节，因此我可以更详细地讲：回答一个大问题：您应该学习SwiftUI，UIKit还是同时学习两者？

SwiftUI可以在哪里使用？
SwiftUI在iOS 13，macOS 10.15，tvOS 13和watchOS 6或这些平台的任何更高版本上运行。这意味着，如果您使用的应用程序必须支持iOS N-1甚至N-2（即当前版本和该版本之前的一两个版本），那么您甚至需要一年或两年的时间才能考虑迁移到SwiftUI 。

但是，重要的是，不要将SwiftUI视为类似于Java的Swing或React Native的多平台框架。官方说法似乎是，SwiftUI不是一个多平台框架，而是一个用于在多个平台上创建应用程序的框架。

听起来可能是一样的，但是有一个重要的区别：Apple并不是说您可以在每个平台上使用相同的SwiftUI代码，因为有些事情是不可能的–无法在Mac上使用Apple Watch的数字王冠例如，并且类似地在watchOS应用上具有选项卡栏也将无法工作。

SwiftUI会取代UIKit吗？
不会。SwiftUI的许多部分直接建立在现有UIKit组件（例如UITableView）的顶部。当然，许多其他部分则没有，它们是SwiftUI而非UIKit呈现的新控件。

但是重点并不是UIKit涉及的程度。相反，关键是我们不在乎。 SwiftUI或多或少完全掩盖了UIKit的行为，因此，如果您为SwiftUI编写应用程序，而Apple在两年内用一头可歌唱的大象取代了UIKit，则无需在意–只要Apple使大象具有相同的方法和属性即可该UIKit暴露于SwiftUI，您的代码不变。

SwiftUI是否使用自动布局？
虽然肯定会在幕后使用Auto Layout进行某些操作，但作为SwiftUI设计师并没有向我们展示过。取而代之的是，它使用了灵活的盒式布局系统，这对于来自Web的开发人员来说是熟悉的。

SwiftUI快吗？
SwiftUI快得惊人-到目前为止，在我所有的测试中，它似乎都超过了UIKit。与做到这一点的团队交谈后，我开始明白为什么：首先，他们积极地扁平化图层层次结构，这样系统就不必做更多的绘制了，但是第二步，很多操作完全绕过了Core Animation，直接去了Metal进行了额外的处理。速度。

所以，是的：SwiftUI的速度非常快，而且所有这些都无需我们做任何额外的工作。

为什么看不到我的代码预览？
使用SwiftUI时，可以同时查看视图代码和视图预览（外观）很有帮助。如果您可以看到代码而不是预览，则可能是您尚未升级到macOS 10.15；必须先进行预览。

代码与预览的匹配程度如何？
对预览进行任何更改时，它也会更新生成的代码。同样，如果更改代码，它也会更新用户界面。因此，代码和预览是相同的，并且始终保持同步。

为什么我的颜色看起来有点偏？
SwiftUI为我们提供了标准的系统颜色，例如红色，蓝色和绿色，但这些并不是UIColor可能习惯的纯红色，蓝色和绿色。取而代之的是，这些是可以自动适应明暗模式的新样式颜色，这意味着根据您的系统外观，它们看起来会更亮或更暗。

UIKit死了吗？
没有！苹果在本周的WWDC上播出了大量的新UIKit功能。如果Apple仍在WWDC上谈论UIKit的新功能，那您就很安全-没有使他们惊讶地淘汰它的风险。

您可以混合使用SwiftUI和UIKit的视图吗？
是!您可以将一个嵌入另一个，效果很好。


### 回答一个大问题：您应该学习SwiftUI，UIKit还是同时学习两者？
保罗·哈德森@twostraws 2019年9月18日

全面更新了Xcode 11.5

在我问过的所有SwiftUI问题中，有一个比其他任何问题都多：“我正在学习Swift：我应该学习SwiftUI还是我也需要学习UIKit？”

人们似乎想听到的答案是“忘记旧的UIKit了–您应该专注于SwiftUI！”但是，事实很简单，那就是绝大多数人都不会从该建议中获得成功，因此值得详细解释原因。

在详细介绍之前，我想澄清一件事：SwiftUI是一个了不起的用户界面框架，并且绝对会100％成为Apple平台上应用程序开发的未来。但是，如果您想今天（或在未来一到两年左右的任何时间）构建出色的应用程序，那么您也100％绝对需要UIKit的知识，特别是如果您打算使应用程序开发成为您的职业。

好的，顺便说一句，在忽略UIKit的同时关注SwiftUI的问题归结为三点：

API覆盖范围有限。
限制采用。
支持有限。
让我们分解一下...

API覆盖范围有限
无论您是想在公司工作还是在业余时间开发业余爱好应用程序，SwiftUI的一个缺点是它目前没有与UIKit一样广泛的API覆盖范围。

例如，如果要在网格中显示项目，则可以在UIKit中使用UICollectionView，但是SwiftUI没有等效项。或者，如果您想让用户输入多行文本，则可以在UIKit中使用UITextView，但是SwiftUI也没有等效项。

这并不是苹果公司的懒惰，而是有意为之：他们不是先发布其所有API的包装器，而是不得不稍后进行更改，而是采取更为谨慎的方法并逐步添加API。 （我希望！）这应该减少我们将来看到的重大更改的数量，因为它使Apple的工程师有更多的时间来细化他们打算交付的API子集。

很多时候，您会找到解决方法，但老实说，当您知道某件事在UIKit中是微不足道的，但在SwiftUI中并非不可能时，这很累。有时甚至是简单的事情：如何更改表格上的分隔符插入？或如何将文本框添加到警报中？这些是UIKit中的单行代码，但在SwiftUI中不可用。

随着时间的流逝，我完全希望看到SwiftUI会添加更多功能，使其与UIKit达到同等水平，但现在距离我们还有很长的路要走。

限制采用
SwiftUI仅在WWDC2019上宣布，并且可在iOS 13设备或更高版本中使用。这立即意味着：

迄今为止，几乎所有编写的应用程序都使用UIKit。
需要支持iOS n-1或n-2的任何应用（例如iOS 12和iOS 11）甚至都无法开始切换到SwiftUI一年或更长时间。
这意味着，如果您打算在未来三年内找到一份iOS开发人员的工作，则UIKit经验实际上是必不可少的，因为这是现有代码库所使用的。实际上，我完全希望UIKit在四年后仍将是主导的UI平台。我想没有人-甚至没有苹果！ –希望iOS社区能够以任何快速的步伐迁移到SwiftUI。在UIKit应用中投入了大量的代码，大量的时间和大量的金钱，并且它拥有漫长而幸福的生活。

有些人试图在采用Swift和采用SwiftUI之间进行区分，但这没有帮助。采用Swift的速度很快，因为它可以在Apple支持的每个框架（UIKit，SpriteKit等）中工作，并且还已经支持iOS n-1，因此许多公司可以立即切换到它。

再一次，我想重申，SwiftUI绝对将成为Apple平台开发的未来，但是要在UIKit级别获得采用将需要很长时间。

同时，SwiftUI是个人应用程序，爱好应用程序，原型应用程序或一般实验的理想选择。如果您有幸加入专门使用SwiftUI的公司，请尽情享受吧！

有限的支持
UIKit已有十多年的历史了，这意味着a）几乎您可能遇到的每个问题都已经被他人解决，并且b）那里有许多提供扩展和自定义功能的库。

尽管有些学习者可能会想到高级开发人员会掌握大量UIKit，但简单的事实是，我们所有人都使用Google，Stack Overflow，利用Swift进行黑客入侵等工具来找到问题的解决方案。当您绝望时，这实际上是将错误消息粘贴到网站中，但是无论您如何获得答案，它都可以节省大量在线查找错误消息的时间。

SwiftUI仅凭借显着更新而已，可用的解决方案却少得多。实际上，寻找从未有人尝试过的东西很普遍-实际上，您是第一人称。那可能会很有趣，但是如果您有一个真正的专业人士

### 从UIKit迁移到SwiftUI
保罗·哈德森@twostraws 2019年9月18日
全面更新了Xcode 11.5
如果您以前使用过UIKit，则只需删除UI前缀即可将许多您熟悉和喜爱的类直接映射到它们的SwiftUI等效项。这并不意味着它们是相同的东西，只是它们具有相同或相似的功能。

以下是一个入门指南，其中包含UIKit类名和SwiftUI名称：

UITableView: List
UICollectionView: No SwiftUI equivalent
UILabel: Text
UITextField: TextField
UITextField with isSecureTextEntry set to true: SecureField
UITextView: No SwiftUI equivalent
UISwitch: Toggle
UISlider: Slider
UIButton: Button
UINavigationController: NavigationView
UIAlertController with style .alert: Alert
UIAlertController with style .actionSheet: ActionSheet
UIStackView with horizontal axis: HStack
UIStackView with vertical axis: VStack
UIImageView: Image
UISegmentedControl: SegmentedControl
UIStepper: Stepper
UIDatePicker: DatePicker

NSAttributedString：与SwiftUI不兼容；改用Text。
SwiftUI还具有许多其他独有的组件，例如使我们能够按深度而不是水平或垂直构建事物的堆栈视图。

### 奉献精神
保罗·哈德森@twostraws 2019年9月18日

全面更新了Xcode 11.5

在Apple内部，SwiftUI的设计，构建，测试，文档编制和交付花费了巨大的精力。作为第三方开发人员，我们只能真正看到最终的结果–当高级Apple职员在WWDC上台并在掌声中炫耀时，当我们下载新的Xcode以查看大量新功能时，以及启动时我们自己的旅程，找出如何充分利用这些令人难以置信的新工具。

但是SwiftUI远早于watchOS团队内部的一个项目开始-大约在四年前，这是各种人所说的。

四年。

在大约1500天的时间里，苹果的工程师正在努力构建自己知道的东西，这将彻底改变我们的工作方式，并且将充分体现Swift能够进行UI开发。如果您想像今天所了解的那样构建SwiftUI需要花费多少工作，请想象一下，Swift本身从1.0到5.1经历了多少变化！

不允许这些工程师与公众讨论他们的工作，即使在Apple内部，也只有少数人知道SwiftUI的存在。为了使SwiftUI成为现实，UIKit团队，Swift团队，Xcode团队，开发人员出版物团队等等的所有人都必须秘密聚集在一起代表我们工作，即使到今天，您仍然找不到他们因其出色的工作而受到赞誉。

一个简单的事实是，没有很多人的不懈努力，SwiftUI不可能实现。我希望我可以在这里列出他们并亲自感谢他们，但是我唯一可以确定的是在WWDC会议上以“ SwiftUI工程师”为职称的人，或者是我在实验室中与之交谈的人。

因此，这本书致力于Dave Abrahams，Luca Bernardi，Kevin Cathey，Nate Cook，Michael Gorbach，John Harper，Taylor Kelly，Kyle Macomber，Raj Ramamurthy，Matt Ricketson，Jacob Xiao和所有其他从事过这项工作的人很难使SwiftUI变成今天。我们可能永远都不知道AppKit，UIKit，WatchKit，Xcode，Swift，开发人员出版物以及更多的其他人将SwiftUI带入了生活，但是我希望他们每个人都被我们社区令人难以置信的积极反应所震撼。

我知道WWDC通常可以说是“照片处理”，在主题演讲之前的一两天，功能便会出现，但是你们把它拉开了，我们非常感谢。

## 建立一个完整的项目
通过真实的应用程序项目学习SwiftUI

###

###

###

##

##

