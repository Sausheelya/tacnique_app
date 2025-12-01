ActiveAdmin.register Quiz do
  permit_params :title,
                questions_attributes: [
                  :id,
                  :content,
                  :question_type,
                  :options,
                  :correct_answer,
                  :_destroy
                ]

  index do
    selectable_column
    id_column
    column :title
    column :created_at
    actions
  end

  filter :id
  filter :title
  filter :created_at

  form do |f|
    f.inputs "Quiz Details" do
      f.input :title
    end

    f.inputs "Questions" do
      # IMPORTANT: options hash, then `do |q|`
      f.has_many :questions, allow_destroy: true do |q|
        q.input :content
        q.input :question_type, as: :select,
                collection: [['MCQ', 'mcq']]
        q.input :options,
                hint: 'JSON array for MCQ only, e.g. ["Red", "Blue", "Green"]'
        q.input :correct_answer
      end
    end

    f.actions
  end
end