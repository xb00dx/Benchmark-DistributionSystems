function [LUSolv,tax_files,tax_dir,out_dir,my_reg] = user_configuration(user_name)

if (strcmp(user_name,'default') ~= 0)
    %LU solver for powerflow - note the KLU solver must be manually added to GridLAB-D
    %KLU is available at http://gridlab-d.svn.sourceforge.net/svnroot/gridlab-d/tools/solver_klu
        %0 = superLU (Default solver)
        %1 = KLU - 64 bit build
        %2 = KLU - 32 bit build
        LUSolv = 0;

    % Which files to look for to populate; single files or lists are
    %   acceptable; 'GC' will populate multiple regions if listed multiple times
        tax_files =   {'GC-12.47-1.glm';'GC-12.47-1.glm';'GC-12.47-1.glm';'GC-12.47-1.glm';'GC-12.47-1.glm';...
            'R1-12.47-1.glm';'R1-12.47-2.glm';'R1-12.47-3.glm';'R1-12.47-4.glm';'R1-25.00-1.glm';...
            'R2-12.47-1.glm';'R2-12.47-2.glm';'R2-12.47-3.glm';'R2-25.00-1.glm';'R2-35.00-1.glm';...
            'R3-12.47-1.glm';'R3-12.47-2.glm';'R3-12.47-3.glm';'R4-12.47-1.glm';'R4-12.47-2.glm';...
            'R4-25.00-1.glm';'R5-12.47-1.glm';'R5-12.47-2.glm';'R5-12.47-3.glm';'R5-12.47-4.glm';...
            'R5-12.47-5.glm';'R5-25.00-1.glm';'R5-35.00-1.glm'};

    % Directory to look for the base taxonomy feeders
        tax_dir = 'C:\..\Taxonomy_Feeders\';
        
    % Select where you want the file written to: 
        %   can be left as '' to write in the working directory 
        %   make sure and end the line with a '\' if pointing to a directory
       out_dir = '';

    % Set region to use for extraction, 0 will pull information from the user_name of
    %  the feeder (only works with taxonomy feeders), 1-6 will assign region as
    %  specificed in regionalization.m
        my_reg = 0;
        
elseif (strcmp(user_name,'Jason') ~= 0)
    LUSolv = 0;
    tax_files =   {'GC-12.47-1.glm';'R1-12.47-1.glm'};
    tax_dir = 'C:\Users\D3X289\Documents\GLD_Analysis_2012\GridLABD\Taxonomy_Feeders\';
    out_dir = 'C:\Users\D3X289\Documents\GLD_Analysis_2012\GridLABD\Taxonomy_Feeders\';
    my_reg = 0;
elseif (strcmp(user_name,'Frank') ~= 0)
    LUSolv = 1;
    tax_files =   {'GC-12.47-1.glm';'R1-12.47-1.glm'};
    tax_dir = 'C:\Code\Taxonomy_Feeders\';
    out_dir = 'C:\Code\Taxonomy_Feeders\Extracted\';
    my_reg = 0;
elseif (strcmp(user_name,'Kevin') ~= 0)
    LUSolv = 1;
    tax_files =   {'GC-12.47-1.glm';'R1-12.47-1.glm'};
    tax_dir = 'C:\Users\d3p313\Desktop\Base_Case\';
    out_dir = 'C:\Users\d3p313\Desktop\Base_Case\Extracted Files\';
    my_reg = 0;
elseif (strcmp(user_name,'Trevor') ~= 0)
    LUSolv = 1;
    %tax_files =   {'R4-25.00-1.glm'}; 
  tax_files =   {'GC-12.47-1.glm';'GC-12.47-1.glm';'GC-12.47-1.glm';'GC-12.47-1.glm';'GC-12.47-1.glm';...
            'R1-12.47-1.glm';'R1-12.47-2.glm';'R1-12.47-3.glm';'R1-12.47-4.glm';'R1-25.00-1.glm';...
            'R2-12.47-1.glm';'R2-12.47-2.glm';'R2-12.47-3.glm';'R2-25.00-1.glm';'R2-35.00-1.glm';...
            'R3-12.47-1.glm';'R3-12.47-2.glm';'R3-12.47-3.glm';'R4-12.47-1.glm';'R4-12.47-2.glm';...
            'R4-25.00-1.glm';'R5-12.47-1.glm';'R5-12.47-2.glm';'R5-12.47-3.glm';'R5-12.47-4.glm';...
            'R5-12.47-5.glm';'R5-25.00-1.glm';'R5-35.00-1.glm'};
    tax_dir = '/Users/hard312/Gridlab-D/Taxonomy_Feeders/';
    out_dir = '/Users/hard312/Gridlab-D/Taxonomy_Feeders/Taxonomy_Feeder_Testbed/';
    my_reg = 0;
else
    error('User configuration "user_name" was not recognized.');
end

end