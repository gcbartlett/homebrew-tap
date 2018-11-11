class DoxygenAT1811 < Formula
  desc "Generate documentation for several programming languages"
  homepage "http://www.doxygen.org/"
  url "http://ftp.stack.nl/pub/users/dimitri/doxygen-1.8.11.src.tar.gz"
  mirror "https://downloads.sourceforge.net/project/doxygen/rel-1.8.11/doxygen-1.8.11.src.tar.gz"
  sha256 "65d08b46e48bd97186aef562dc366681045b119e00f83c5b61d05d37ea154049"
  head "https://github.com/doxygen/doxygen.git"

  bottle :unneeded

  keg_only :versioned_formula

  option "with-graphviz", "Build with dot command support from Graphviz."
  option "with-qt5", "Build GUI frontend with Qt support."
  option "with-libclang", "Build with libclang support."

  deprecated_option "with-dot" => "with-graphviz"
  deprecated_option "with-doxywizard" => "with-qt5"

  depends_on "cmake" => :build
  depends_on "graphviz" => :optional
  depends_on "qt5" => :optional
  depends_on "llvm" if build.with? "libclang"

  def install
    args = std_cmake_args
    args << "-Dbuild_wizard=ON" if build.with? "qt5"
    args << "-Duse_libclang=ON -DLLVM_CONFIG=#{Formula["llvm"].opt_bin}/llvm-config" if build.with? "libclang"

    mkdir "build" do
      system "cmake", "..", *args
      system "make"
    end
    bin.install Dir["build/bin/*"]
    man1.install Dir["doc/*.1"]
  end

  test do
    system "#{bin}/doxygen", "-g"
    system "#{bin}/doxygen", "Doxyfile"
  end
end
