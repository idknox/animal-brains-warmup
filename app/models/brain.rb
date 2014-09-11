require "csv"

class Brain < ActiveRecord::Base

  def seed
    string = file_to_string
    write_file(string)
  end

  def file_to_string
    output = ""
    CSV.foreach("./lib/assets/Animals.csv", :headers => :first_row) do |row|
      unless row == row.first
        create_string = "Brain.create!(animal: '#{row[0]}', body: #{row[1]}, " +
          "brain: #{row[2]}) \n \n"
        output += create_string
      end
    end
    output
  end

  def write_file(string)
    tmp = Tempfile.new("temp")
    tmp << string
    tmp.close
    FileUtils.mv(tmp.path, "./db/seeds.rb")
  end


end