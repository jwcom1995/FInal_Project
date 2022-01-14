package com.project.eatda.dao;

import java.util.List;

import com.project.eatda.dto.RecipeDto;
import com.project.eatda.dto.RecipePageBaseDto;


public interface RecipeDao {
	String NAMESPACE_RECIPE = "recipe.";
	
	public List<RecipeDto> recipeList(RecipePageBaseDto rpbdto); //레시피메인			
	public RecipeDto recipeDetail(int recipe_no); 					
	public int recipeInsert(RecipeDto dto); 							
	public int recipeUpdate(RecipeDto dto);							
	public int recipeDelete(int recipe_no); 
	
	public int recipeCount(int recipe_no);
	public RecipeDto searchRecipe(String tag); 			
	public RecipeDto recommandRecipe(String category); 	

	public int getTotal(RecipePageBaseDto rpbdto);

	/* 관리자 리스트 */
	public List<RecipeDto> adminRecipeList();
}
