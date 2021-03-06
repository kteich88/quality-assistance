class Validation
  def self.compare_records(txt_record, pdf_record)
    if txt_record == pdf_record
      puts 'Test Complete.'.colorize(:light_blue)
      puts 'ALL TEXT RECORDS MATCH'.green
      exit
    else
      index = 1
      self.verify_data(txt_record, pdf_record, index)
    end
  end

  def self.verify_data(txt_record, pdf_record, index)
    until index == txt_record.length
      self.verify_recipient(txt_record, pdf_record, index) if txt_record[index] != pdf_record[index]
      index += 1
    end
    puts 'Test Complete.'.colorize(:light_blue)
    puts 'EXCEPT ERRORS PRINTED ABOVE, ALL TEXT RECORDS MATCH'.green
    puts ''
    exit
  end

  def self.verify_recipient(txt_record, pdf_record, index)
    if txt_record[index][0] != pdf_record[index][0]
      puts "Record # #{index}".red
      puts "Recipient #{txt_record[index][0]} does not match #{pdf_record[index][0]}".red
      puts ''
    end
    self.verify_address(txt_record, pdf_record, index)
  end

  def self.verify_address(txt_record, pdf_record, index)
    if txt_record[index][1].upcase != pdf_record[index][1].upcase
      puts "Record # #{index}".red
      puts "Address #{txt_record[index][1]} does not match #{pdf_record[index][1]}".red
      puts ''
    end
    self.verify_city(txt_record, pdf_record, index)
  end

  def self.verify_city(txt_record, pdf_record, index)
    if txt_record[index][2] != pdf_record[index][2]
      puts "Record # #{index}".red
      puts "City #{txt_record[index][2]} does not match #{pdf_record[index][2]}".red
      puts ''
    end
      self.verify_state(txt_record, pdf_record, index)
  end

  def self.verify_state(txt_record, pdf_record, index)
    if txt_record[index][3] != pdf_record[index][3]
      puts "Record # #{index}".red
      puts "State #{txt_record[index][3]} does not match #{pdf_record[index][3]}".red
      puts ''
    end
    self.verify_zipcode(txt_record, pdf_record, index)
  end

  def self.verify_zipcode(txt_record, pdf_record, index)
    if txt_record[index][4] != pdf_record[index][4]
      puts "Record # #{index}".red
      puts "Zipcode #{txt_record[index][4]} does not match #{pdf_record[index][4]}".red
      puts ''
    end
  end
end
