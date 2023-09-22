require 'httparty'

# find address function
def fizz(addr, passlist)
	system("clear || cls")
	puts "Waiting for connection ..."
	pages = File.readlines(passlist)

if ! addr.include?('http://')
    addr = 'http://'+addr
end

for i in pages   
    re = HTTParty.get(addr+'/'+i.chomp)
    if re.code == 200
        puts "<!> #{addr}/#{i} PAGE FOUND!!!!!!!!!!!!!!!!!!!!"
    else
        puts "<§> #{addr}/#{i}  page not found "
    end
end

    #after resualt ...
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
    
    ┌─[Blade~ #Home/Fizz]
    └╼ <†> '
addr = gets.chomp;
print '
    <§> Type your passwordlist name.txt (password list path = fizz/passlist/) DEFAULT => passlist.txt:
    
    ┌─[Blade~ #Home/Fizz]
    └╼ <†> '
passlist = gets.chomp;

if passlist != nil 
    fizz addr, "fizz/passlist/list.txt"
else 
    fizz addr, passlist
end