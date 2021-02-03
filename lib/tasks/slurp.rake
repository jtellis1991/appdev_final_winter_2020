namespace :slurp do
  desc "TODO"
  task questions: :environment do
  
    require "csv"  
    
    # i = 1
    # while i < 21 
    #   if i < 10
    #     off_id = "2015.01.3.0" + i.to_s
    #   else  
    #     off_id = "2015.01.3." + i.to_s
    #   end
    #   q = Question.where({:question_id => off_id}).last
    #   q.destroy
    #   i = i + 1
      
      # q = Question.where({:question_id => nil}).last
      # q.destroy
      # i = i + 1
      
    # end
    
    csv_text = File.read(Rails.root.join("lib", "csvs", "questions_2015_01_3.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    
    csv.each do |row|
        t = Question.new
        t.official_id = row["official_id"]
        t.prompt = row["prompt"]
        t.body = row["body"]
        t.image = row["image"]
        t.difficulty = row["difficulty"]
        t.test_id = 1
        t.category_id = 1
        t.save!
        puts "#{t.official_id} saved"
    end
    
  end

end
