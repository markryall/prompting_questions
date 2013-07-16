desc 'dump data'
task dump: :environment do
  Answer.includes(:question).each do |a|
    puts "Answer #{a.id}\n"
    puts "#{a.question.description}\n"
    puts "#{a.content}"
    puts '------------'
  end
end
