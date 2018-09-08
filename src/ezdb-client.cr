require "socket"
require "./version"

# This class interacts with the ezdb daemon
module Ezdb
class Client
  @hostname : String
  @port : Int8 | Int16 | Int32 | Int64

  def initialize(@hostname = "127.0.0.1", @port = 28468)
    @socket = TCPSocket.new(@hostname, @port)
    @socket.tcp_nodelay = true
  end

  def set(key, value)
    send("set #{key} #{value}")
  end

  def qset(key, value)
    send("qset #{key} #{value}")
    ""
  end

  def inc(key)
    send("inc #{key}")
  end

  def get(key)
    send("get #{key}")
  end

  def append(key, value)
    send("append #{key} #{value}")
  end

  def pop(key)
    send("pop #{key}")
  end

  def delete(key)
    send("delete #{key}")
  end

  def hello
    send("hello")
  end

  def size
    send("size")
  end

  def exit
    send("exit")
  end

  def send(raw)
    @socket.puts(raw)
    @socket.gets
  end
end
end
