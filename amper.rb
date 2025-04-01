class Amper < Formula
  desc "A project configuration and build tool with a focus on the user experience and the IDE support"
  homepage "https://github.com/JetBrains/amper/"
  license "Apache-2.0"
  url "https://packages.jetbrains.team/maven/p/amper/amper/org/jetbrains/amper/cli/0.6.0/cli-0.6.0-wrapper?download=true"
  sha256 "cfddb5d2e4d00a3464e5457ddbb60414184eef423da24fe236d4264e68a7b5f0"
  version "0.6.0"

  depends_on "kdoctor"

  def install
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/cli-0.6.0-wrapper" => "amper"
    chmod "+x", "#{libexec}/cli-0.6.0-wrapper"
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
