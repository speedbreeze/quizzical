{* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is Quizzical.
 *
 * The Initial Developer of the Original Code is Jonathan Wilde.
 * Portions created by the Initial Developer are Copyright (C) 2009 - 2010
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either the GNU General Public License Version 2 or later (the "GPL"), or
 * the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** *}

{extends "layout"}

{block "content"}
<div class="row">
	<div class="cell width-12 position-2 confirm">
		{errors($errors)}
	
		{if isset($question_object->id)}
		{Form::open("question/edit/$question_object->id")}
		{else}
		{Form::open("question/create/$question_object->quiz->id")}
		{/if}
		
			<div class="field">
				<label>Question</label>
				<input type="text" name="content"
					value="{$question_object->content}" />
			</div>
			
			<h3>Answer Choices</h3>
			
			{for index 0 $end}
			<div class="field">
				<label>Choice</label>
				
				<input type="text" class="text" name="choice-{$index}"
					value="{tif $answers ? $answers.$index->content}" />
				
				{if $answers}
				<input type="hidden" name="choice-{$index}-id" 
					value="{$answers.$index->id}" />
				{/if}
			</div>
			
			<div class="field inline-field linked">
				<div class="radio-field">
					<input type="radio" name="correct" value="{$index}" 
						{tif $answers.$index->correct ? 'checked="checked"'} />
				</div>
				<label>This is the correct choice.</label>
			</div>
			{/for}
			
			<input type="hidden" name="count" value="{$count}" />
			
			<input type="submit" class="button partial-width" value="Save" />
			<div class="cancel">
			{* This will generate an extra query.  This needs to be avoided. *}
				or <a href="{URL::site("quiz/edit/$question_object->quiz->id")}">Cancel</a>
			</div>
		</form>
	</div>
</div>
{/block}