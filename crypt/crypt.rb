def encrypt(word, key)
    word2AsciiArr = word.chars.map { |char| char.ord }
    move = word2AsciiArr.map { |char| char + key }
    
    #after resualt ...
    system("clear || cls")
    print "
    <§> Result: #{move.map { |char| char.chr }.join}

    <1> Back to Home
    <2> Exit
    
    ┌─[Blade~ #Home/GetInfo]
    └╼ <†> "
    choose = gets.to_i
    if choose == 1
        system("ruby blade.rb")
    else
        exit
    end
end

def decrypt(word, key)
    word2AsciiArr = word.chars.map { |char| char.ord }
    move = word2AsciiArr.map { |char| char - key }

    #after resualt ...
    system("clear || cls")
    print "
    <§> Result: #{move.map { |char| char.chr }.join}

    <1> Back to Menu
    <2> Exit
    
    ┌─[Blade~ #Home/Crypt/Decrypt]
    └╼ <†> "
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
    <§> Choose one of the following:

    <1> Encrypt
    <2> Decrypt
    
    ┌─[Blade~ #Home/Crypt]
    └╼ <†> '
choose = gets.to_i

system("clear || cls")
if choose == 1
    print '
    <§> Type your word:

    ┌─[Blade~ #Home/Crypt/Encrypt]
    └╼ <†> '
    word = gets.chomp
    print '
    <§> Type key number(1 - 8):

    ┌─[Blade~ #Home/Crypt/Encrypt]
    └╼ <†> '
    key = gets.to_i
    
    encrypt(word, key)
else
    print '
    <§> Type your word:

    ┌─[Blade~ #Home/Crypt/Decrypt]
    └╼ <†> '
    word = gets.chomp
    print '
    <§> Type key number(1 - 8):

    ┌─[Blade~ #Home/Crypt/Decrypt]
    └╼ <†> '
    key = gets.to_i
    
    decrypt(word, key)
end
