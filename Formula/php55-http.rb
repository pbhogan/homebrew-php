require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php55Http < AbstractPhp55Extension
  init
  homepage 'http://pecl.php.net/package/pecl_http'
  url 'http://pecl.php.net/get/pecl_http-1.7.6.tgz'
  # sha1 '44e28b6d2d9d352c5b949f14bc4dd612e4365c85'
  sha256 'e87207a7dcd713bef0eb3701b552e0d173fbd73dbd52f9d3968851112e899983'
  head 'http://svn.php.net/repository/pecl/http/trunk/'

  def install
    Dir.chdir "pecl_http-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}", phpconfig
    system "make"
    prefix.install "modules/http.so"
    write_config_file unless build.include? "without-config-file"
  end
end

