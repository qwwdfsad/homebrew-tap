## qwwdfsad tap

Small Homebrew tap for Java-related profiling tools.

Usage:

```bash
brew tap qwwdfsad/tap
brew install async-profiler
brew install hsdis
```

### async-profiler

Formula for the binary installation of [async-profiler](https://github.com/async-profiler/async-profiler)
that adds `asprof` to the corresponding `*/bin/*` and provides a convenience wrapper over `converter.jar`.

Installation:
```
brew tap qwwdfsad/tap
brew install async-profiler
```

Usage:
```
asprof -f profile.html -d 20 <pid|JPS name>
asprof-converter jfr2flame --bci profile.jfr profile.html
```

Additionaly, formula installs `libasyncProfiler.dylib` into Homebrew prefix (`$HOMEBREW_PREFIX/lib/`) for the easier discovery.

To further use `async-profiler` with JMH's [`-prof async`](https://github.com/openjdk/jmh/blob/641f0480632f47e0dbdbf454105bbda550dd5eb7/jmh-core/src/main/java/org/openjdk/jmh/profile/AsyncProfiler.java#L65) seamlessly,
consider adding the installed `dylib` into `DYLD_LIBRARY_PATH`. The brew installation will hint you on that.

### Amper

Formula for the binary installation of the standalone [Amper](https://github.com/JetBrains/amper/) to make it globally-available and upgradeable:

```
brew tap qwwdfsad/tap
brew install amper

amper --help
```

### hsdis

Formula for the installation of hsdis -- [Hotspot disassembly library](https://blogs.oracle.com/javamagazine/post/java-hotspot-hsdis-disassembler) for Java:
```
brew tap qwwdfsad/tap
brew install hsdis
```

The formula builds it from OpenJDK sources against Capstone with the [effortless-hsdis](https://github.com/qwwdfsad/effortless-hsdis)
and installs the hsdis dylib into Homebrew keg.

The installer will give you a hint what to do next:
```
hsdis was installed into /opt/homebrew/opt/hsdis/libexec/lib/hsdis-aarch64.dylib
In order to make it locateable by the JVM, you can either add it to Java's lib folder ($JAVA_HOME/lib/)
or add a lib path to the $DYLD_LIBRARY_PATH:
$ echo 'export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/opt/homebrew/opt/hsdis/libexec/lib/' >> ~/.zshrc
```

<!--- development flow comment: you need brew install --build-from-source ./<formula-name>.rb  -->

