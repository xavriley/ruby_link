require 'mkmf-rice'

CWD = File.expand_path(File.dirname(__FILE__))
LINK_DIR = File.join(CWD, 'link')

HEADER_DIRS = [
  "..",
  File.join(LINK_DIR, "include"),
  File.join(LINK_DIR, "modules/asio-standalone/asio/include"),
]

LIB_DIRS = []

dir_config("libs", HEADER_DIRS, LIB_DIRS)

case RUBY_PLATFORM
when /.*arm.*-linux.*/
  $defs << ' -DLINK_PLATFORM_LINUX=1 '
when /.*linux.*/
  $defs << ' -DLINK_PLATFORM_LINUX=1 '
when /.*darwin.*/
  $defs << ' -DLINK_PLATFORM_MACOSX=1 '
when /.*mingw.*/, /bccwin32/
  $defs << ' -DLINK_PLATFORM_WINDOWS=1 '
  $defs << ' /wd4503 '
else
  RUBY_PLATFORM
end

$CXXFLAGS += " -std=c++11 -stdlib=libc++ "

create_makefile('ableton_link')
