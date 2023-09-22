logo = '▄▄▄▄· ▄▄▌   ▄▄▄· ·▄▄▄▄  ▄▄▄ .
▐█ ▀█▪██•  ▐█ ▀█ ██▪ ██ ▀▄.▀·
▐█▀▀█▄██▪  ▄█▀▀█ ▐█· ▐█▌▐▀▀▪▄
██▄▪▐█▐█▌▐▌▐█ ▪▐▌██. ██ ▐█▄▄▌
·▀▀▀▀ .▀▀▀  ▀  ▀ ▀▀▀▀▀•  ▀▀▀ 

'
system("clear || cls")
puts logo

print '
    <§> Choose one of the following:

    <1> Crypt(Encryptor & Decryptor)
    <2> GetInfo (Get website info)
    <3> Fizz (url finder)
    <4> clash (DDos Attacker)

    <5> github address
    <6> Exit
    ┌─[Blade~ #Home]
    └╼ <†> '
choose = gets.to_i

if choose == 1
    system("ruby crypt/crypt.rb")
elsif choose == 2
    system("ruby getinfo/getinfo.rb")
elsif choose == 3
    system("ruby fizz/fizz.rb")
elsif choose == 4
    system("ruby clash/clash.rb")
elsif choose = 5
    system("clear || cls")
    puts "<!> https://github.com/RadiFr3Y/blade"
    gets
    system("ruby blade.rb")
else
    exit
end