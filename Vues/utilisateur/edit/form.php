<?php
    $O_utilisateur = $A_vue['utilisateur'];
?>
<h1>Editer l'utilisateur "<?php echo $O_utilisateur->donneLogin(); ?>"</h1>
<form name="utilisateur"
      id="utilisateur"
      method="post"
      action="/utilisateur/miseajour/<?php echo $O_utilisateur->donneIdentifiant(); ?>"
      onsubmit="return validateForm(this)">
    <div id="corpForm">
        <fieldset id="coordonnees">
            <legend>Renseignements requis</legend>
            <p>
                <label for="login" title="Veuillez saisir un intitulé" class="oblig">* Login :</label>
                <input type="text" name="login" id="login" title="Veuillez saisir un login" tabindex="1"
                       value="<?php echo $O_utilisateur->donneLogin(); ?>"
                       onfocus="this.className='focus';"
                       onblur="this.className='normal';"
                       onchange="javascript:this.value=this.value.toLowerCase();" />
                <span class="legende">ex : 'utilisateur1'</span>
            </p>
        </fieldset>
        <br />
        <em>* Champs obligatoires</em>
    </div>
    <div id="piedForm">
        <input type="submit" name="valid" id="valid" value="Mettre à jour" title="Cliquez sur ce bouton pour valider votre inscription" tabindex="9" />
    </div>
</form>