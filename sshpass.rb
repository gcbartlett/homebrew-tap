class Sshpass < Formula
  desc "Non-interactive ssh password auth"
  homepage "https://sourceforge.net/projects/sshpass/"
  url "https://downloads.sourceforge.net/projects/sshpass/files/sshpass/1.06/sshpass-1.06.tar.gz"
  sha256 "f4d37465f208576aa568656de10d96b7fc4b2bb3d249a1348afa3bdf2983379f"
  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
  test do
    system "sshpass"
  end
end
