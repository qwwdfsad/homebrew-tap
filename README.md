## qwwdfsad tap

Small Homebrew tap for Java-related profiling tools.

Usage:

```bash
brew tap qwwdfsad/tap
brew install async-profiler
```

### async-profiler

Formula for the binary installation of [async-profiler](https://github.com/async-profiler/async-profiler)
that adds `asprof` to the corresponding `*/bin/*` and provides a convenience wrapper over `converter.jar`.

Installation:
```
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