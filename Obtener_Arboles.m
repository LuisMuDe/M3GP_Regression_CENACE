
Formulas = cell(1,length(b.tree.kids));
for t = 1:length(b.tree.kids)
    Formulas{t} = tree2str(b.tree.kids{t});
    fprintf('Formula %d: %s\n', t, Formulas{t});
end