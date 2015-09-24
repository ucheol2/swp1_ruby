phone_book = []

loop do
    puts "****행동을 선택하세요 | a: 전화번호 추가, v:전화번호 보기, d: 전화번호 삭제, q: 종료****"
    command = gets.chomp
    if command.downcase == 'a'
        print "이름을 입력하세요 : "
        name = gets.chomp
        dup = false
        phone_book.each do |item|
            if item[:name] == name
                dup = true
            end
        end
        if dup
            puts "중복된 이름입니다"
        else
            print "전화번호를 입력하세요 : "
            number = gets.chomp
            loop do
                print "성별을 입력하세요 (m: 남자, f: 여자) : "
                genderInput = gets.chomp
                if genderInput.downcase == 'm'
                    @gender = "Male"
                    break
                elsif genderInput.downcase == 'f'
                    @gender = "Female"
                    break
                else
                    puts "Invalid input"
                end
            end
            phone_book << {name: name, phoneNumber: number, gender: @gender}
        end
    elsif command.downcase == 'v'
        puts "***전화번호 목록***"
        phone_book.each do |item|
            puts "#{item[:name]}님 | 전화번호: #{item[:phoneNumber]}, 성별: #{item[:gender]} "
        end
        puts ""
    elsif command.downcase == 'd'
        puts "***전화번호 목록***"
        phone_book.each do |item|
            puts "#{item[:name]}님 | 전화번호: #{item[:phoneNumber]}, 성별: #{item[:gender]} "
        end
        print "삭제할 이름을 입력하세요 : "
        deleteTarget = gets.chomp
        count1 = phone_book.count
        phone_book.delete_if { |item| item[:name] == deleteTarget }
        if count1 == phone_book.count
            puts "***해당 인물을 찾을 수 없습니다!***"
        else
            puts "***삭제되었습니다***"
        end
    elsif command.downcase == 'q'
        puts "빠잉~"
        break
    else
        puts "***Invalid command***"
    end
end