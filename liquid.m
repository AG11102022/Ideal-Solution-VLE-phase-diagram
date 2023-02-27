function y = liquid(P, AE_2, AE_1)
y = (P - AE_2)./(AE_1 - AE_2);
end

% Check equation 13.2.6 for more detail in:
% https://chem.libretexts.org/Bookshelves/Physical_and_Theoretical_Chemistry_Textbook_Maps/DeVoes_Thermodynamics_and_Chemistry/13%3A_The_Phase_Rule_and_Phase_Diagrams/13.02%3A__Phase_Diagrams-_Binary_Systems