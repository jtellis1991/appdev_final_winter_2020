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
        t.question_id = row["official_id"]
        t.prompt = row["body"]
        t.A = row["A"]
        t.B = row["B"]
        t.C = row["C"]
        t.D = row["D"]
        t.answer_value = "blank"
        t.answer_explanation = "blankblank"
        t.save
        puts "#{t.question_id} saved"
    end
    
  end

end
