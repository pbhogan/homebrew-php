require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php55Http1 < AbstractPhp55Extension
  init
  homepage 'http://pecl.php.net/package/pecl_http'
  url 'http://pecl.php.net/get/pecl_http-1.7.6.tgz'
  sha1 '44e28b6d2d9d352c5b949f14bc4dd612e4365c85'
  head 'http://svn.php.net/repository/pecl/http/trunk/'

  def install
    Dir.chdir "pecl_http-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/http1.so"
    write_config_file unless build.include? "without-config-file"
  end
end
