module TournamentsHelper
  def add_participant_link(form_builder)
    link_to_function 'add a participant' do |page|
        form_builder.fields_for :participations, Participation.new, :child_index => 'NEW_RECORD' do |f|
        html = render(:partial => 'participant', :locals => { :form => f })
        page << "$('participants').insert({ bottom: '#{escape_javascript(html)}'.replace(/NEW_RECORD/g, new Date().getTime()) });"
      end
    end
  end
  
  # Display the remove link for a child form
  def remove_participant_link(form_builder)
    if form_builder.object.new_record?
      # If the task is a new record, we can just remove the div from the dom
      link_to_function("remove", "$(this).up('.participant').remove();");
    else
      # However if it's a "real" record it has to be deleted from the database,
      # for this reason the new fields_for, accept_nested_attributes helpers give us _delete,
      # a virtual attribute that tells rails to delete the child record.
      form_builder.hidden_field(:_delete) +
      link_to_function("remove", "$(this).up('.participant').hide(); $(this).previous().value = '1'")
    end
  end
end
