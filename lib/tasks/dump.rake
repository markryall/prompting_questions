desc 'dump data'
task dump: :environment do
  Answer.all.each do |answer|
    puts <<EOF
Response #{answer.id}

Question:

#{answer.question.description}

Answer:

#{answer.content}
------------
EOF
  end
end
