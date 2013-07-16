desc 'dump data'
task dump: :environment do
  Answer.includes(:question).each do |a|
    puts <<EOF
Response #{a.id}

Question:

#{a.question.description}

Answer:

#{a.content}
------------
EOF
  end
end
