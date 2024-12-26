file:///D:/Work/Project/Exercism/scala/bob/src/main/scala/Bob.scala
### java.nio.file.InvalidPathException: Illegal char <:> at index 3: jar:file:///C:/Program%20Files/Java/jdk-23/lib/src.zip!/java.base/java/lang/String.java

occurred in the presentation compiler.

presentation compiler configuration:


action parameters:
offset: 601
uri: file:///D:/Work/Project/Exercism/scala/bob/src/main/scala/Bob.scala
text:
```scala
object Bob:
  def yell(msg: String): Boolean =
    msg.toUpperCase == msg && msg.toLowerCase != msg

  def question(msg: String): Boolean =
    msg.trim.endsWith("?")

  def yellAndQuestion(msg: String): Boolean =
    yell(msg) && question(msg)

  def silence(msg: String): Boolean =
    msg.trim == ""

  def response(msg: String): String =
    // if yellAndQuestion(msg) then "Calm down, I know what I'm doing!"
    // else if yell(msg) then "Whoa, chill out!"
    // else if question(msg) then "Sure."
    // else if silence(msg) then "Fine. Be that way!"
    // else "Whatever."
    msg.trim match@@

```



#### Error stacktrace:

```
java.base/sun.nio.fs.WindowsPathParser.normalize(WindowsPathParser.java:204)
	java.base/sun.nio.fs.WindowsPathParser.parse(WindowsPathParser.java:175)
	java.base/sun.nio.fs.WindowsPathParser.parse(WindowsPathParser.java:77)
	java.base/sun.nio.fs.WindowsPath.parse(WindowsPath.java:92)
	java.base/sun.nio.fs.WindowsFileSystem.getPath(WindowsFileSystem.java:231)
	java.base/java.nio.file.Path.of(Path.java:148)
	java.base/java.nio.file.Paths.get(Paths.java:69)
	scala.meta.io.AbsolutePath$.apply(AbsolutePath.scala:58)
	scala.meta.internal.metals.MetalsSymbolSearch.$anonfun$definitionSourceToplevels$2(MetalsSymbolSearch.scala:70)
	scala.Option.map(Option.scala:242)
	scala.meta.internal.metals.MetalsSymbolSearch.definitionSourceToplevels(MetalsSymbolSearch.scala:69)
	dotty.tools.pc.completions.CaseKeywordCompletion$.dotty$tools$pc$completions$CaseKeywordCompletion$$$sortSubclasses(MatchCaseCompletions.scala:342)
	dotty.tools.pc.completions.CaseKeywordCompletion$.matchContribute(MatchCaseCompletions.scala:292)
	dotty.tools.pc.completions.Completions.advancedCompletions(Completions.scala:358)
	dotty.tools.pc.completions.Completions.completions(Completions.scala:130)
	dotty.tools.pc.completions.CompletionProvider.completions(CompletionProvider.scala:93)
	dotty.tools.pc.ScalaPresentationCompiler.complete$$anonfun$1(ScalaPresentationCompiler.scala:154)
```
#### Short summary: 

java.nio.file.InvalidPathException: Illegal char <:> at index 3: jar:file:///C:/Program%20Files/Java/jdk-23/lib/src.zip!/java.base/java/lang/String.java