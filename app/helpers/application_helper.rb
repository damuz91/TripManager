module ApplicationHelper

    def external_link_helper(link,text)
        link_to("#{text} <i class='glyphicon glyphicon-new-window'></i>".html_safe,link, target: '_blank')
    end
end
