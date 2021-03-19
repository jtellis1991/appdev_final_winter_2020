namespace :slurp do
  desc "TODO"
  # task questions: :environment do
  
  #   require "csv"  
    
  #   # i = 1
  #   # while i < 21 
  #   #   if i < 10
  #   #     off_id = "2015.01.3.0" + i.to_s
  #   #   else  
  #   #     off_id = "2015.01.3." + i.to_s
  #   #   end
  #   #   q = Question.where({:question_id => off_id}).last
  #   #   q.destroy
  #   #   i = i + 1
      
  #     # q = Question.where({:question_id => nil}).last
  #     # q.destroy
  #     # i = i + 1
      
  #   # end
    
  #   csv_text = File.read(Rails.root.join("lib", "csvs", "questions.csv"))
  #   csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
  #   csv.each do |row|
  #       t = Question.new
  #       t.official_id = row["official_id"]
  #       t.prompt = row["prompt"]
  #       t.body = row["body"]
  #       t.image = row["image"]
  #       t.difficulty = row["difficulty"]
  #       t.test_id = 1
  #       t.category_id = 1
  #       t.save!
  #       puts "#{t.official_id} saved"
  #   end
  # end
  
  task tests: :environment do
    require "csv"  
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "tests.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
        t = Test.new
        t.official_id = row["official_id"]
        t.name = row["name"]
        t.save!
        puts "#{t.name} saved"
    end
    puts "There are now #{Test.count} rows in the tests table"
  end
  
  task styles: :environment do
    require "csv"  
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "styles.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
        t = Style.new
        t.name = row["name"]
        t.save!
        puts "#{t.name} saved"
    end
    puts "There are now #{Style.count} rows in the styles table"
  end
  
  task categories: :environment do
    require "csv"  
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "categories.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
        t = Category.new
        t.name = row["name"]
        t.save!
        puts "#{t.name} saved"
    end
    puts "There are now #{Category.count} rows in the categories table"
  end
  
  task questions: :environment do
    require "csv"  
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "questions.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
        t = Question.new
        t.image = row["image"]
        t.prompt = row["prompt"]
        t.body = row["body"]
        t.official_id = row["official_id"]
        t.difficulty = row["difficulty"]
        t.test_id = row["test_id"]
        t.category_id = row["category_id"]
        t.style_id = row["style_id"]
        t.save!
        puts "#{t.official_id} saved"
    end
    puts "There are now #{Question.count} rows in the questions table"
  end
  
  task options: :environment do
    require "csv"  
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "options.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
        t = Option.new
        t.value = row["value"]
        t.question_id = row["question_id"]
        t.correct = row["correct"]
        t.save!
        puts "#{t.question_id} saved"
    end
    puts "There are now #{Option.count} rows in the options table"
  end
  
  task answers: :environment do
    require "csv"  
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "answers.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
        t = Answer.new
        t.question_id = row["question_id"]
        t.correct_answer = row["correct_answer"]
        t.save!
        puts "#{t.correct_answer} saved"
    end
    puts "There are now #{Answer.count} rows in the answers table"
  end
  
  task strategies: :environment do
    require "csv"  
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "strategies.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
        t = Strategy.new
        t.name = row["name"]
        t.symbol = row["symbol"]
        t.save!
        puts "#{t.name} saved"
    end
    puts "There are now #{Strategy.count} rows in the strategies table"
  end

end
