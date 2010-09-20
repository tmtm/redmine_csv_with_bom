require 'redmine'

IssuesHelper.module_eval do
  alias csv_with_bom_issues_to_csv_orig issues_to_csv
  def issues_to_csv(*args)
    ret = csv_with_bom_issues_to_csv_orig *args
    if l(:general_csv_encoding) == 'UTF-8'
      ret = "\xEF\xBB\xBF"+ret
    end
    ret
  end
end

Redmine::Plugin.register :redmine_csv_with_bom do
  name 'Redmine CSV with BOM plugin'
  author 'TOMITA Masahiro'
  description 'This is a plugin for Redmine to prepend '
  version '0.0.1'
  url 'http://github.com/tmtm/redmine_csv_with_bom'
  author_url 'http://github.com/tmtm'
end
