class Hsdis < Formula
  desc "An OpenJDK hotspot disassembly library package"
  homepage "https://github.com/openjdk/jdk/tree/master/src/utils/hsdis"
  license "The Universal Permissive License (UPL)"
  sha256 "9db89ef5c6e08d07aaaf4a1f66ce4211c9931e28a6066e474db84e52eccf1cb5"
  url "https://github.com/qwwdfsad/effortless-hsdis/archive/refs/tags/v0.1.zip"

  depends_on "cmake" => :build

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args(install_prefix: libexec)
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
    system "ls", "-l", "build"
    hsdis = Dir["#{libexec}/lib/hsdis-*.dylib"].first
    lib.install_symlink hsdis
  end

  def caveats
    hsdis = Dir["#{libexec}/lib/hsdis-*.dylib"].first
    <<~EOS
      hsdis was installed into #{hsdis}
      In order to make it locateable by the JVM, you can either add it to Java's lib folder ($JAVA_HOME/lib/)
      or add a lib path to the $DYLD_LIBRARY_PATH:
      $ echo 'export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:#{libexec}/lib/' >> ~/.zshrc
    EOS
  end
end
