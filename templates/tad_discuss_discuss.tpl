<{$toolbar}>


<{if $op=="tad_discuss_form"}>

  <{foreach item=discuss from=$form_data}>
    <{includeq file="db:tad_discuss_form.tpl"}>
  <{/foreach}>

<{elseif $op=="show_one_tad_discuss"}>
  <{$js}>
  <span class="label label-info"><a href="discuss.php?BoardID=<{$BoardID}>" style="color:white;"><{$BoardTitle}></a></span>
  <h1><{$DiscussTitle}></h1>
  <{foreach item=discuss from=$discuss_data}>
    <{if $display_mode=="top" || $display_mode=="bottom"}>
      <{includeq file="db:tad_discuss_talk_bubble_vertical.tpl"}>
    <{elseif $display_mode=="mobile"}>
      <{includeq file="db:tad_discuss_mobile.tpl"}>
    <{elseif $display_mode=="clean"}>
      <{includeq file="db:tad_discuss_clean.tpl"}>
    <{elseif $display_mode=="default" || $display_mode=="left"}>
      <{includeq file="db:tad_discuss_talk_bubble.tpl"}>
    <{else}>
      <{includeq file="db:tad_discuss_bootstrap.tpl"}>
    <{/if}>
  <{/foreach}>

  <div class="row">
    <div class="col-sm-12 text-center"><{$bar}></div>
  </div>


  <{$formValidator_code}>
  <link rel="stylesheet" type="text/css" media="screen" href="reset.css" />
  <script type="text/javascript" src="class/nicEdit.js"></script>
  <script type="text/javascript">
    bkLib.onDomLoaded(function() { new nicEditor({fullPanel : true, iconsPath : 'class/nicEditorIcons.gif'}).panelInstance('DiscussContent'); });
  </script>
  <script src="<{$xoops_url}>/modules/tadtools/multiple-file-upload/jquery.MultiFile.js"></script>

  <form action="discuss.php" method="post" id="myForm" enctype="multipart/form-data" class="form-horizontal" role="form">
    <{foreach item=discuss from=$form_data}>
      <{if $display_mode=="top" || $display_mode=="bottom"}>
        <{includeq file="db:tad_discuss_talk_bubble_vertical.tpl"}>
      <{elseif $display_mode=="mobile"}>
        <{includeq file="db:tad_discuss_mobile.tpl"}>
      <{elseif $display_mode=="clean"}>
        <{includeq file="db:tad_discuss_clean.tpl"}>
      <{elseif $display_mode=="default" || $display_mode=="left"}>
        <{includeq file="db:tad_discuss_talk_bubble.tpl"}>
      <{else}>
        <{includeq file="db:tad_discuss_bootstrap.tpl"}>
      <{/if}>
    <{/foreach}>
  </form>

<{elseif $main_data}>


  <h1><{$ShowBoardTitle}></h1>

	<{$FooTableJS}>
	<div class="well" style="background-color:white;">
  	<table class="table table-striped table-hover">
  	<thead>
  	<tr>
  		<th data-class="expand"><{$smarty.const._MD_TADDISCUS_DISCUSSTITLE}></th>
  		<th data-hide="phone"><{$smarty.const._MD_TADDISCUS_DISCUSSRE}></th>
  		<th data-hide="phone"><{$smarty.const._MD_TADDISCUS_UID}></th>
  		<th data-hide="phone"><{$smarty.const._MD_TADDISCUS_LAST_RE}></th>
  	</tr>
  	</thead>

  	<tbody>

    <{if $main_data}>
      <{foreach item=discuss from=$main_data}>
        <tr>
      		<td>
            <img src="images/<{if $discuss.onlyTo}>lock.png<{else}>greenpoint.gif<{/if}>" alt="<{$discuss.DiscussTitle}>" title="<{$discuss.DiscussTitle}>" align="absmiddle" style="margin-right:3px;"><a href="discuss.php?DiscussID=<{$discuss.DiscussID}>&BoardID=<{$discuss.BoardID}>" style="color:<{if $discuss.onlyTo}>maroon<{else}>#505050<{/if}>"><{$discuss.DiscussTitle}></a>
          </td>
      		<td class="text-center"><{$discuss.renum}></td>
      		<td><div style="font-size:10px;"><{$discuss.DiscussDate}></div><div><{$discuss.uid_name}></div></td>
      		<td><div style="font-size:10px;"><{$discuss.LastTime}></div><div><{$discuss.last_uid_name}></div></td>
    		</tr>
      <{/foreach}>
    <{else}>
      <tr>
        <td colspan=4 class="text-center">
          <{if $post}>
            <img src="images/add.png" align="absmiddle" hspace=4 alt="<{$smarty.const._MD_TADDISCUS_ADD_DISCUSS}>">
            <a href="discuss.php?op=tad_discuss_form&BoardID=<{$DefBoardID}>"><{$smarty.const._MD_TADDISCUS_DISCUSS_EMPTY}></a>
          <{/if}>
        </td>
      </tr>
    <{/if}>
  	<tr>
    	<td colspan=5>
    	<{$post_tool}>
      </td>
    </tr>
  	</tbody>
  	</table>
	</div>
  <{$bar}>
<{else}>

  <div class="jumbotron">
    <a href="admin/main.php?op=tad_discuss_board_form"><{$smarty.const._MD_TADDISCUS_BOARD_EMPTY}></a>
  </div>

<{/if}>

<{include file='db:system_notification_select.html'}>