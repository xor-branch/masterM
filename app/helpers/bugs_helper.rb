module BugsHelper
  def render_statut(bug)
    format_statut(bug)
  end

  def status_icon_class(bug)
    case bug
    when 'pending'
      'bg-success'
    when 'on_schedule'
      'bg-primary'
    when 'completed'
      'bg-danger'
    end
  end

  def render_date(date)
    date.strftime('%m-%d-%Y')
  end



  def statuts_for_select
    Bug.statuts.map { |b| [format_statut(b[0]), b[0]] }
  end

  def deletion_modal_id(bug)
    "deletion-modal-bug-#{bug.id}"
  end

  private

  def format_statut(bug)
    bug.gsub('_', ' ').capitalize
  end
end
