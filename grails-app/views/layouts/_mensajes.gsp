<%--
  Created by IntelliJ IDEA.
  User: joxebus
  Date: 3/10/12
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>

<div id="messages"  style="display: none"><!-- Messages are shown when a link with these attributes are clicked: href="#messages" rel="modal"  -->

            <h3>3 Mensajes</h3>

            <p>
                <strong>17th May 2009</strong> by Admin<br/>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue.
                <small><a href="#" class="remove-link" title="Remove message">Remove</a></small>
            </p>

            <p>
                <strong>2nd May 2009</strong> by Jane Doe<br/>
                Ut a est eget ligula molestie gravida. Curabitur massa. Donec eleifend, libero at sagittis mollis, tellus est malesuada tellus, at luctus turpis elit sit amet quam. Vivamus pretium ornare est.
                <small><a href="#" class="remove-link" title="Remove message">Remove</a></small>
            </p>

            <p>
                <strong>25th April 2009</strong> by Admin<br/>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus magna. Cras in mi at felis aliquet congue.
                <small><a href="#" class="remove-link" title="Remove message">Remove</a></small>
            </p>

            <form action="" method="post">

                <h4>New Message</h4>

                <fieldset>
                    <textarea class="textarea" name="textfield" cols="50" rows="4"></textarea>
                </fieldset>

                <fieldset>

                    <select name="dropdown" class="small-input">
                        <option value="option1">Enviar a...</option>
                        <option value="option2">Todos</option>
                        <option value="option3">Administrador</option>
                        <option value="option4">Usuarios de prueba</option>
                    </select>

                    <input class="button" type="submit" value="Send"/>

                </fieldset>

            </form>

</div> <!-- End #messages -->