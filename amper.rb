class Amper < Formula
  desc "A project configuration and build tool with a focus on the user experience and the IDE support"
  homepage "https://github.com/JetBrains/amper/"
  license "Apache-2.0"
  url "https://packages.jetbrains.team/maven/p/amper/amper/org/jetbrains/amper/cli/0.7.0/cli-0.7.0-wrapper?download=true"
  sha256 "0788b201e2b62555c3024775f6ae9046712ff8d9a07aae3fe705277e9691fe6f"
  version "0.6.0"

  depends_on "kdoctor"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/cli-0.7.0-wrapper" => "amper"
    chmod "+x", "#{libexec}/cli-0.7.0-wrapper"
  end

  def caveats
    <<~EOS
      TODO temporary restriction: please run kdoctor manually after the installation
      $ kdoctor
    EOS
  end

  test do
    output = shell_output("#{bin}/amper")
    assert_includes output, "Amper project root"
  end
end
