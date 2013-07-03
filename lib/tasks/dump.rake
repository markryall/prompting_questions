desc 'dump data'
task dump: :environment do
  Answer.includes(:question).each do |a|
    puts a.question.description
    puts a.content
    puts '------------'
  end
end
