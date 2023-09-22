require "net/http"
require "json"

# send request to api and change JSON to list
def GetInfo addr
    url = URI.parse("http://ip-api.com/json/#{addr}")
    request = Net::HTTP::Get.new(url.to_s)
    resualt = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    parsResualt = JSON.parse(resualt.body)

    #after resualt ...
    system("clear || cls")
    puts "  <§> Resualt:\n\n"
    parsResualt.each do |info, res|
        puts "  <!> #{info} => #{res}"
    end
    print ' 
    <1> Back to Home
    <2> Exit

    ┌─[Blade~ #Home/GetInfo]
    └╼ <†> '
    choose = gets.to_i
    if choose == 1
        system("ruby blade.rb")
    else
        exit
    end
end

# menu ...
system("clear || cls")
print '
    <§> Type your Target address:
    
    ┌─[Blade~ #Home/GetInfo]
    └╼ <†> '
choose = gets.chomp; puts
GetInfo choose

