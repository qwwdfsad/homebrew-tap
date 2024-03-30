class AsyncProfiler < Formula
  desc "A low overhead sampling profiler for Java applications"
  homepage "https://github.com/jvm-profiling-tools/async-profiler"
  license "Apache-2.0"
  url "https://github.com/async-profiler/async-profiler/releases/download/v3.0/async-profiler-3.0-macos.zip"
  sha256 "cae4f207c33b964276385272a7cfe3750594cbcc8918f97a4bb67292bdbc43a8"
  # version "3.0" -- redundant, won't pass brew --audit

  # depends_on "openjdk@17" Could be the case, but the last thing I want here is to mess with other people JDKs

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/bin/asprof" => "asprof"
    # Convention: install the lib into Homebrew /usr/local/lib
    lib.install_symlink "#{libexec}/lib/libasyncProfiler.dylib" => "libasyncProfiler.dylib"
    bin.write_jar_script "#{libexec}/lib/converter.jar", "asprof-converter", java_version: "8"
  end

  def caveats
    <<~EOS
      In order to use async-profiler with JMH as '-prof async', append the following to your shell profile (~/.bashrc or ~/.zshrc):
      $ echo 'export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:#{libexec}/lib/libasyncProfiler.dylib' >> ~/.zshrc
    EOS
  end

  # Apparently there is no such thing in brew?
  #   def uninstall
  #     <<~EOS
  #       Don't forget to remove libasyncProfiler.dylib from your shell profile (~/.bashrc or ~/.zshrc) DYLD_LIBRARY_PATH if you confiugired
  # it for JMH.
  #     EOS
  #   end

  test do
    output = shell_output("#{bin}/asprof --help")
    assert_includes output, "Usage: asprof [action] [options] <pid>"
  end
end
