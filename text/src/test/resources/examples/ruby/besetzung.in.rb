<tr class="member">
	<td><%= link_to member.name, :action => :show, :id => member %>,
		<%= h member.instrument %></td>
</tr>
<% @title = "Besetzung - #@instrument" %>

<p>
<%= pluralize(@members.size, 'Sch  ler', 'Sch  ler') %> spielen <%= h @instrument %>:
</p>

<table class="members">
	<%= render :partial => 'member', :collection => @members %>
</table>
<% @title = 'Besetzung: %d Mitglieder' % Member.count -%>

<div class="page-links">
<% if params[:action] == 'all' -%>
<%= link_to 'seitenweise', :action => :index %>
<% else -%>
<%= link_to_if @member_pages.current.previous, '<<', :page => @member_pages.current.previous %>
| <%= link_to 'alle', :action => :all %> |
<%= link_to_if @member_pages.current.next, '>>', :page => @member_pages.current.next %>
<% end -%>
</div>

<table class="members">
<%= render :partial => 'member', :collection => @members %>
</table>
<% @title = "Besetzung - Instrument w  hlen" %>

<ul>
<% for instr in @instruments -%>
<li><%= link_to h(instr), :action => :instrument, :id => instr %></li>
<% end -%>
</ul>
<% @title = "Besetzung: #{@member.name}" -%>

<dl>

<dt>Instrument / Aufgabe:</dt>
<dd><%= h @member.instrument %></dd>

<dt>Geburtstag:</dt>
<dd><%= h @member.birthday.to_s(:dots) %></dd>

<dt>Adresse:</dt>
<dd><%= h @member.street %><br /><%= h @member.plz %></dd>

<dt>Telefon:</dt>
<dd><%= h @member.phone %></dd>

<dt>Email:</dt>
<dd><%= mail_to @member.email, @member.email, :encode => 'javascript' %></dd>

</dl>
