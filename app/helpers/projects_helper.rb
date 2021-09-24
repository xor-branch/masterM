module ProjectsHelper
  # def render_statut(project)
  #   format_statut(project)
  # end
  #
  # def status_icon_class(project)
  #   case project
  #   when 'not_started'
  #     'bg-success'
  #   when 'doing'
  #     'bg-primary'
  #   when 'done'
  #     'bg-danger'
  #   end
  # end
  #
  # def render_date(date)
  #   date.strftime('%m-%d-%Y')
  # end
  #
  #
  #
  # def statuts_for_select
  #   Project.statuts.map { |b| [format_statut(b[0]), b[0]] }
  # end
  #
  # def deletion_modal_id(project)
  #   "deletion-modal-bug-#{project.id}"
  # end
  #
  # private
  #
  # def format_statut(project)
  #   project.gsub('_', ' ').capitalize
  # end
end
