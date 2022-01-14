package com.project.eatda.biz;

import java.util.List;

import com.project.eatda.dto.RecipeDto;
import com.project.eatda.dto.RecipePageBaseDto;


public interface RecipeBiz {
	
	public List<RecipeDto> recipeList(RecipePageBaseDto rpbdto);				
	public RecipeDto recipeDetail(int recipe_no); 		
	public int recipeInsert(RecipeDto dto); 			
	public int recipeUpdate(RecipeDto dto);				
	public int recipeDelete(int recipe_no); 	
	
	public int updateRecipeCount(int recipe_no);
	public RecipeDto searchRecipe(String tag); 			
	public RecipeDto recommandRecipe(String category); 	
	
	public int getTotal(RecipePageBaseDto rpbdto);

	/* 관리자 리스트 */
	public List<RecipeDto> adminRecipeList();
	
}
